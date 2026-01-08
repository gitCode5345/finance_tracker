import 'dart:async';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/data/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  StreamSubscription<supabase.AuthState>? _authSubscription;

  AuthBloc({
    required this.authService,
  }) : super(const AuthState.initial()) {
    on<CheckAuth>(_onCheckAuth);
    on<RegisterUser>(_onRegisterUser);
    on<LoginUser>(_onLoginUser);
    on<LogoutUser>(_onLogoutUser);
    on<_AuthStatusChanged>(_onAuthStatusChanged);

    _authSubscription = authService.authStateChanges.listen((data) {
      add(AuthEvent.authStatusChanged(data.session?.user));
    });
  }

  Future<void> _onCheckAuth(CheckAuth event, Emitter<AuthState> emit) async {
    final user = authService.currentUser;
    if (user != null) {
      emit(AuthState.authenticated(user: _mapSupabaseUserToModel(user)));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  void _onAuthStatusChanged(_AuthStatusChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(AuthState.authenticated(user: _mapSupabaseUserToModel(event.user!)));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onRegisterUser(RegisterUser event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await authService.signUp(
        email: event.user.email,
        password: event.user.password,
        phone: event.user.phone,
        userData: {
          'first_name': event.user.firstName,
          'last_name': event.user.lastName,
          'phone': event.user.phone,
          'date_of_birth': event.user.dateOfBirth,
        },
      );
    } catch (e) {
      emit(AuthState.error(error: e.toString()));
    }
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await authService.signIn(
        email: event.email,
        password: event.password,
      );
    } catch (e) {
      emit(AuthState.error(error: e.toString()));
    }
  }

  Future<void> _onLogoutUser(LogoutUser event, Emitter<AuthState> emit) async {
    try {
      await authService.signOut();
    } catch (e) {
      emit(AuthState.error(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  User _mapSupabaseUserToModel(supabase.User supabaseUser) {
    final metadata = supabaseUser.userMetadata ?? {};
    return User(
      id: supabaseUser.id,
      email: supabaseUser.email ?? '',
      password: '',
      firstName: metadata['first_name'] ?? '',
      lastName: metadata['last_name'] ?? '',
      phone: metadata['phone'] ?? '',
      dateOfBirth: metadata['date_of_birth'] ?? '',
    );
  }
}
