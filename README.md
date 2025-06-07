# Studia

A comprehensive Flutter educational platform that helps users track their learning progress, manage skills, and engage with educational content.

## 📱 Features

### 🔐 Authentication
- Google Sign-In integration
- User registration and profile management
- Secure local storage of user data
- Multi-language support (Vietnamese, English)

### 👤 Profile Management
- Edit user profile information
- Track learning performance across skills
- View skill progress and analytics
- Sort skills by various criteria (latest, oldest, performance)

### 📚 Learning Modules
- **Information Feature**: Browse domains, levels, skills, and standards
- **Skills Tracking**: Monitor progress in different skill areas
- **Standards Management**: Track performance against educational standards
- **Progress Analytics**: Detailed progress reporting and visualization

### 💬 Communication
- Chat functionality for user interaction
- WebSocket integration for real-time messaging

### 🎮 Interactive Learning
- Playground feature for hands-on learning
- User performance tracking and updates

### ⚙️ Settings
- Language preferences (Vietnamese/English)
- User customization options

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a feature-based modular structure:

```
lib/
├── core/                    # Shared core functionality
│   ├── constants/          # App constants and text
│   ├── data/              # Data sources and database
│   ├── domain/            # Core entities and repositories
│   ├── error/             # Error handling
│   ├── navigation/        # Navigation logic
│   ├── network/           # Network utilities
│   ├── theme/             # App theming
│   ├── usecases/          # Core use cases
│   ├── util/              # Utilities
│   └── widgets/           # Reusable widgets
├── features/              # Feature-based modules
│   ├── auth/              # Authentication
│   ├── chat/              # Chat functionality
│   ├── home/              # Home screen
│   ├── information/       # Educational content
│   ├── main/              # Main app screens
│   ├── menu/              # Navigation menu
│   ├── playground/        # Interactive learning
│   ├── profile/           # User profile
│   ├── settings/          # App settings
│   ├── skills/            # Skills management
│   └── splash/            # Splash screen
```

Each feature follows the Clean Architecture pattern:
- **Data Layer**: Repositories, data sources, models
- **Domain Layer**: Entities, repositories interfaces, use cases
- **Presentation Layer**: BLoC, pages, widgets

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC Pattern
- **Database**: Drift (SQLite)
- **Dependency Injection**: Injectable/GetIt
- **Functional Programming**: Dartz
- **Authentication**: Google Sign-In
- **Real-time Communication**: WebSocket
- **Testing**: Flutter Test, Mockito, Mocktail

## 🧪 Testing

The project includes comprehensive unit tests for all use cases:

```bash
# Run all tests
flutter test

# Run specific feature tests
flutter test test/auth/
flutter test test/profile/
flutter test test/home/domain/
```

### Test Coverage
- ✅ Authentication use cases
- ✅ Profile management use cases  
- ✅ Home feature use cases
- ✅ Skills tracking use cases
- ✅ Information feature use cases
- ✅ Settings use cases
- ✅ Playground use cases

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd studia
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for dependency injection and database)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development Commands

```bash
# Generate mocks and code
flutter pub run build_runner build --delete-conflicting-outputs

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Format code
dart format .

# Analyze code
flutter analyze
```

## 📦 Dependencies

### Core Dependencies
- `flutter_bloc` - State management
- `dartz` - Functional programming
- `injectable` - Dependency injection
- `get_it` - Service locator
- `drift` - Database ORM

### Testing Dependencies
- `flutter_test` - Testing framework
- `mockito` - Mocking framework
- `mocktail` - Alternative mocking
- `build_runner` - Code generation

### Other Dependencies
- `google_sign_in` - Google authentication
- `equatable` - Value equality

## 🌐 Localization

The app supports multiple languages:
- Vietnamese (vi)
- English (en)

Language switching is available in the settings screen.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable and function names
- Write unit tests for new features
- Maintain clean architecture principles

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- BLoC library contributors
- Open source community

---

**Made with ❤️ using Flutter**
