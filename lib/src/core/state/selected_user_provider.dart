import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';

// Estado global centralizado (usado para várias telas no aplicativo)
final selectedUserProvider = StateProvider<User?>((ref) => null);
