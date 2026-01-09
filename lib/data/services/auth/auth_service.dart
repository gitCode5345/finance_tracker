import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient get _client => Supabase.instance.client;
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  User? get currentUser => _client.auth.currentUser;

  Future<AuthResponse> signUp({required String email, required String password, required Map<String, dynamic> userData,}) async {
    return await _client.auth.signUp(
      email: email,
      password: password,
      data: userData,
    );
  }

  Future<AuthResponse> signIn({required String email, required String password,}) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> updateUser() async {
    await _client.auth.updateUser(UserAttributes(
      data: {'is_new_user' : false},
    ));
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
