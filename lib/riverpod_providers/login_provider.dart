import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';


class AuthState {
  final bool isAuthenticated;
  final String? username;

  AuthState({this.isAuthenticated = false, this.username});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final read;
  AuthNotifier(this.read) : super(AuthState()) {
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final username = await read(sharedPreferencesServiceProvider).getUsername();
    if (username != null) {
      state = AuthState(isAuthenticated: true, username: username);
    }
  }

  Future<void> login(String username) async {
    state = AuthState(isAuthenticated: true, username: username);
    await read(sharedPreferencesServiceProvider).setUsername(username);
  }

  Future<void> logout() async {
    state = AuthState(isAuthenticated: false);
    await read(sharedPreferencesServiceProvider).clearUsername();
  }
}

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }
}

class LoginFormState {
  final String username;
  final String password;

  LoginFormState({
    this.username = '',
    this.password = '',
  });

  LoginFormState copyWith({
    String? username,
    String? password,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}




