abstract class LoginRepositoryLocal {
  Future<Map<String, dynamic>> getUser();
  Future<void> saveUser(String id, String email);
  Future<void> removeUser();
}
