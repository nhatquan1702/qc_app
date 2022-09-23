
import 'package:chat_app/mvvm/model/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthViewModel(authRepository: authRepository, ref: ref);
});

class AuthViewModel {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthViewModel({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }
}
