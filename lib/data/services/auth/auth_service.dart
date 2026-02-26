import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:finance_tracker/data/models/user/user.dart' as user_model;

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

  Future<void> updateUserData(user_model.User user) async {
    await _client.auth.updateUser(
      UserAttributes(
        data: {
          'first_name': user.firstName,
          'last_name': user.lastName,
          'phone': user.phone,
          'date_of_birth': user.dateOfBirth,
        },
        email: user.email
      ),
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
