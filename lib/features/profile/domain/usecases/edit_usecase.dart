import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/profile/domain/repositories/profile_repository.dart';

class EditProfileUsecase {
  final UserProvider userProvider;
  final ProfileRepository profileRepository;

  EditProfileUsecase(this.userProvider, this.profileRepository);

  Future<void> call({
    String? firstName,
    String? lastName,
    String? gender,
    Levels? level,
    int? birthYear,
  }) async {
    final user = userProvider.user;
    final newUser = user!.copyWith(
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      level: level,
      birthYear: birthYear,
    );
    profileRepository.updateProfile(newUser);
  }
}
