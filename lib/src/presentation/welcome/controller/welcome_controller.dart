import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/state/selected_user_provider.dart';
import '../../../data/repositories/user_repository_impl.dart';
import '../../../domain/entities/user.dart';

part 'welcome_controller.g.dart';

// @riverpod
// Future<List<User>> fetchUsers(ref) async {
//   final userRepository = ref.read(userRepositoryProvider);
//   return userRepository.fetchUsers();
// }

@riverpod
class WelcomeController extends _$WelcomeController {
  WelcomeController();
  // Sempre tem de ser FutureOr, caso a gente queira um retorno assíncrono
  @override
  FutureOr<List<User>> build() async {
    final userRepository = ref.read(userRepositoryProvider);
    return userRepository.fetchUsers();
  }

  void chooseUser(User selectedUser) {
    state = AsyncLoading();
    ref.read(selectedUserProvider.notifier).state = selectedUser;
  }
}
