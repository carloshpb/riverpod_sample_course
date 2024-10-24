import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';
import '../datasources/user_datasource_impl.dart';

part 'user_repository_impl.g.dart';

@riverpod
UserRepository userRepository(ref) {
  final userDataSource = ref.read(userDataSourceProvider);
  return UserRepositoryImpl._(userDataSource);
}

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl._(this.dataSource);

  @override
  Future<List<User>> fetchUsers() {
    return dataSource.getUsers();
  }

  @override
  Future<User> fetchUserById(int id) {
    return dataSource.getUser(id);
  }
}
