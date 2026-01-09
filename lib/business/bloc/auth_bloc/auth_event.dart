part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthEvent() = CheckAuth;
  const factory AuthEvent.authStatusChanged(supabase.User? user) = _AuthStatusChanged;
  const factory AuthEvent.registerUserEvent({required User user}) = RegisterUser;
  const factory AuthEvent.loginUserEvent({required String email, required String password}) = LoginUser;
  const factory AuthEvent.registerUserSuccessEvent({required User user}) = RegisterUserSuccess;
  const factory AuthEvent.logoutEvent() = LogoutUser;
}
