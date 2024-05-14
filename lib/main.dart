import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_flutter_assignment/model/user_model.dart';
import 'package:riverpod_flutter_assignment/repository/repo.dart';
import 'package:riverpod_flutter_assignment/riverpod_providers/login_provider.dart';
import 'package:riverpod_flutter_assignment/screens/homeScreen/homeScreen.dart';
import 'package:riverpod_flutter_assignment/screens/login_screen/login_screen.dart';
import 'package:riverpod_flutter_assignment/services/shared_preferances.dart';
import 'package:riverpod_flutter_assignment/utilities/urls.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read);
});
final loginFormProvider = StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper()
    );
  }
}

class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.isAuthenticated ? HomePage() : LoginScreen();
  }
}

