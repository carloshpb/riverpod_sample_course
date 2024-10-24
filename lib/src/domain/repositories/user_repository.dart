import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
  Future<User> fetchUserById(int id);
}
