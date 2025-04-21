# Testing Strategy

This document outlines the testing strategy for the Flutter application, ensuring comprehensive coverage across all layers of the Clean Architecture.

## Testing Pyramid

We follow the Testing Pyramid approach:

```
    /\
   /  \
  /    \
 / E2E  \
/--------\
/ Widget  \
/----------\
/   Unit     \
--------------
```

- **Unit Tests**: Largest number of tests, focusing on individual components
- **Widget Tests**: Medium number of tests, focusing on UI components
- **Integration/E2E Tests**: Smallest number of tests, focusing on full user flows

## Test Coverage Goals

- **Unit Tests**: Aim for 90%+ coverage
- **Widget Tests**: Aim for 70%+ coverage of UI components
- **Integration Tests**: Cover all critical user flows

## Test Types by Layer

### Domain Layer Tests

#### Entity Tests

Test the business objects to ensure they behave as expected:

```dart
void main() {
  group('User Entity', () {
    test('should create valid user entity', () {
      final user = User(id: 1, name: 'Test User');
      expect(user.id, 1);
      expect(user.name, 'Test User');
    });
    
    test('two users with same properties should be equal', () {
      final user1 = User(id: 1, name: 'Test User');
      final user2 = User(id: 1, name: 'Test User');
      expect(user1, user2);
    });
  });
}
```

#### Use Case Tests

Test the business logic without dependencies on external systems:

```dart
void main() {
  late GetUserUseCase getUserUseCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserUseCase = GetUserUseCase(mockUserRepository);
  });

  test('should get user from the repository', () async {
    // Arrange
    final tId = 1;
    final tUser = User(id: tId, name: 'Test User');
    when(mockUserRepository.getUser(tId))
        .thenAnswer((_) async => Right(tUser));
    
    // Act
    final result = await getUserUseCase(tId);
    
    // Assert
    expect(result, Right(tUser));
    verify(mockUserRepository.getUser(tId));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
```

### Data Layer Tests

#### Repository Tests

Test the repositories to ensure they correctly handle data sources:

```dart
void main() {
  late UserRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UserRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getUser', () {
    final tId = 1;
    final tUserModel = UserModel(id: tId, name: 'Test User');
    final User tUser = tUserModel;

    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getUser(any))
          .thenAnswer((_) async => tUserModel);
      
      // Act
      await repository.getUser(tId);
      
      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call is successful', () async {
        // Arrange
        when(mockRemoteDataSource.getUser(any))
            .thenAnswer((_) async => tUserModel);
        
        // Act
        final result = await repository.getUser(tId);
        
        // Assert
        verify(mockRemoteDataSource.getUser(tId));
        expect(result, equals(Right(tUser)));
      });

      test('should cache the data locally when the call is successful', () async {
        // Arrange
        when(mockRemoteDataSource.getUser(any))
            .thenAnswer((_) async => tUserModel);
        
        // Act
        await repository.getUser(tId);
        
        // Assert
        verify(mockRemoteDataSource.getUser(tId));
        verify(mockLocalDataSource.cacheUser(tUserModel));
      });

      test('should return server failure when the call is unsuccessful', () async {
        // Arrange
        when(mockRemoteDataSource.getUser(any))
            .thenThrow(ServerException());
        
        // Act
        final result = await repository.getUser(tId);
        
        // Assert
        verify(mockRemoteDataSource.getUser(tId));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return locally cached data when available', () async {
        // Arrange
        when(mockLocalDataSource.getLastUser())
            .thenAnswer((_) async => tUserModel);
        
        // Act
        final result = await repository.getUser(tId);
        
        // Assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastUser());
        expect(result, equals(Right(tUser)));
      });

      test('should return CacheFailure when no cached data is present', () async {
        // Arrange
        when(mockLocalDataSource.getLastUser())
            .thenThrow(CacheException());
        
        // Act
        final result = await repository.getUser(tId);
        
        // Assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastUser());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
```

#### Data Source Tests

Test the data sources to ensure they correctly interact with APIs/databases:

```dart
void main() {
  late UserRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = UserRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getUser', () {
    final tId = 1;
    final tUserModel = UserModel(id: tId, name: 'Test User');
    final tJsonMap = {'id': 1, 'name': 'Test User'};

    test('should perform a GET request with user id', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(json.encode(tJsonMap), 200));
      
      // Act
      await dataSource.getUser(tId);
      
      // Assert
      verify(mockHttpClient.get(
        Uri.parse('https://api.example.com/users/$tId'),
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return UserModel when the response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(json.encode(tJsonMap), 200));
      
      // Act
      final result = await dataSource.getUser(tId);
      
      // Assert
      expect(result, equals(tUserModel));
    });

    test('should throw a ServerException when the response code is not 200', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      
      // Act
      final call = dataSource.getUser;
      
      // Assert
      expect(() => call(tId), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
```

### Presentation Layer Tests

#### BLoC Tests

Test the BLoCs to ensure they handle events and produce the correct states:

```dart
void main() {
  late UserBloc userBloc;
  late MockGetUserUseCase mockGetUserUseCase;

  setUp(() {
    mockGetUserUseCase = MockGetUserUseCase();
    userBloc = UserBloc(getUserUseCase: mockGetUserUseCase);
  });

  test('initialState should be Empty', () {
    expect(userBloc.state, equals(UserInitial()));
  });

  group('GetUserEvent', () {
    final tId = 1;
    final tUser = User(id: tId, name: 'Test User');

    blocTest<UserBloc, UserState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetUserUseCase(any))
            .thenAnswer((_) async => Right(tUser));
        return userBloc;
      },
      act: (bloc) => bloc.add(GetUserEvent(tId)),
      expect: () => [
        UserLoading(),
        UserLoaded(user: tUser),
      ],
    );

    blocTest<UserBloc, UserState>(
      'should emit [Loading, Error] when getting data fails',
      build: () {
        when(mockGetUserUseCase(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return userBloc;
      },
      act: (bloc) => bloc.add(GetUserEvent(tId)),
      expect: () => [
        UserLoading(),
        UserError(message: 'Server failure'),
      ],
    );
  });
}
```

#### Widget Tests

Test UI components to ensure they render correctly based on state:

```dart
void main() {
  late MockUserBloc mockUserBloc;

  setUp(() {
    mockUserBloc = MockUserBloc();
  });

  testWidgets('should display progress indicator when state is loading',
      (WidgetTester tester) async {
    // Arrange
    when(mockUserBloc.state).thenReturn(UserLoading());
    
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<UserBloc>.value(
          value: mockUserBloc,
          child: UserPage(),
        ),
      ),
    );
    
    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should display user data when state is loaded',
      (WidgetTester tester) async {
    // Arrange
    final tUser = User(id: 1, name: 'Test User');
    when(mockUserBloc.state).thenReturn(UserLoaded(user: tUser));
    
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<UserBloc>.value(
          value: mockUserBloc,
          child: UserPage(),
        ),
      ),
    );
    
    // Assert
    expect(find.text('User: Test User'), findsOneWidget);
  });

  testWidgets('should display error message when state is error',
      (WidgetTester tester) async {
    // Arrange
    when(mockUserBloc.state).thenReturn(UserError(message: 'Error message'));
    
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<UserBloc>.value(
          value: mockUserBloc,
          child: UserPage(),
        ),
      ),
    );
    
    // Assert
    expect(find.text('Error: Error message'), findsOneWidget);
  });
}
```

### Integration Tests

Test end-to-end flows to ensure all layers work together correctly:

```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify user info',
        (WidgetTester tester) async {
      // Build app
      app.main();
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('Press the button to load user'), findsOneWidget);

      // Tap on the floating action button
      await tester.tap(find.byType(FloatingActionButton));
      
      // Wait for loading state
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      
      // Wait for loaded state
      await tester.pumpAndSettle();
      
      // Verify loaded user data
      expect(find.textContaining('User:'), findsOneWidget);
    });
  });
}
```

## Mocking Strategy

We use Mockito/Mocktail for mocking dependencies:

```dart
@GenerateMocks([UserRepository])
void main() {
  // Tests that use MockUserRepository
}
```

## Test Fixtures

Create fixture files for test data:

```dart
// fixtures/user.json
{
  "id": 1,
  "name": "Test User"
}
```

And a fixture reader helper:

```dart
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
```

## Golden Tests

For UI consistency, use golden tests:

```dart
testWidgets('UserPage matches golden file', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<UserBloc>.value(
        value: mockUserBloc,
        child: UserPage(),
      ),
    ),
  );
  
  await expectLater(
    find.byType(UserPage),
    matchesGoldenFile('goldens/user_page.png'),
  );
});
```

## Test Organization

Organize tests to mirror the structure of your application code:

```
test/
├── core/
│   └── network/
│       └── network_info_test.dart
├── features/
│   └── user/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── user_local_data_source_test.dart
│       │   │   └── user_remote_data_source_test.dart
│       │   ├── models/
│       │   │   └── user_model_test.dart
│       │   └── repositories/
│       │       └── user_repository_impl_test.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── user_test.dart
│       │   └── usecases/
│       │       └── get_user_test.dart
│       └── presentation/
│           ├── bloc/
│           │   └── user_bloc_test.dart
│           └── pages/
│               └── user_page_test.dart
└── fixtures/
    └── user.json
```

## Continuous Integration

Automate testing with GitHub Actions:

```yaml
name: Flutter Tests

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: subosito/flutter-action@v1
      with:
        flutter-version: '3.16.0'
    - run: flutter pub get
    - run: flutter analyze
    - run: flutter test --coverage
    - uses: codecov/codecov-action@v1
      with:
        file: ./coverage/lcov.info
```

## Best Practices

1. **Write tests first**: Follow the TDD approach
2. **Keep tests focused**: Each test should test one specific thing
3. **Use clear naming**: Test names should describe what they test
4. **Arrange-Act-Assert**: Structure your tests with this pattern
5. **Don't test the framework**: Focus on your code, not Flutter itself
6. **Test edge cases**: Consider all possible inputs and outcomes
7. **Regularly run tests**: Integrate into your development workflow

## Tools and Resources

- **Testing Framework**: [flutter_test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html)
- **BLoC Testing**: [bloc_test](https://pub.dev/packages/bloc_test)
- **Mocking**: [mockito](https://pub.dev/packages/mockito) or [mocktail](https://pub.dev/packages/mocktail)
- **Code Coverage**: [lcov](https://github.com/linux-test-project/lcov)
- **Flutter Testing Documentation**: [Testing Flutter Apps](https://flutter.dev/docs/testing) 