import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/user.dart';
import '../controller/welcome_controller.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeController = ref.watch(welcomeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: welcomeController.when(
        data: (users) => UserList(
          users: users,
          ref: ref,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final List<User> users;
  final WidgetRef ref;

  const UserList({
    super.key,
    required this.users,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Defina o usuário selecionado globalmente
              ref.read(welcomeControllerProvider.notifier).chooseUser(user);
            },
            child: Text(user.name),
          ),
        );
      },
    );
  }
}
