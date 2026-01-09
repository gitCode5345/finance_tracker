// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckAuth value)?  checkAuthEvent,TResult Function( _AuthStatusChanged value)?  authStatusChanged,TResult Function( RegisterUser value)?  registerUserEvent,TResult Function( LoginUser value)?  loginUserEvent,TResult Function( RegisterUserSuccess value)?  registerUserSuccessEvent,TResult Function( LogoutUser value)?  logoutEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckAuth() when checkAuthEvent != null:
return checkAuthEvent(_that);case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that);case RegisterUser() when registerUserEvent != null:
return registerUserEvent(_that);case LoginUser() when loginUserEvent != null:
return loginUserEvent(_that);case RegisterUserSuccess() when registerUserSuccessEvent != null:
return registerUserSuccessEvent(_that);case LogoutUser() when logoutEvent != null:
return logoutEvent(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckAuth value)  checkAuthEvent,required TResult Function( _AuthStatusChanged value)  authStatusChanged,required TResult Function( RegisterUser value)  registerUserEvent,required TResult Function( LoginUser value)  loginUserEvent,required TResult Function( RegisterUserSuccess value)  registerUserSuccessEvent,required TResult Function( LogoutUser value)  logoutEvent,}){
final _that = this;
switch (_that) {
case CheckAuth():
return checkAuthEvent(_that);case _AuthStatusChanged():
return authStatusChanged(_that);case RegisterUser():
return registerUserEvent(_that);case LoginUser():
return loginUserEvent(_that);case RegisterUserSuccess():
return registerUserSuccessEvent(_that);case LogoutUser():
return logoutEvent(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckAuth value)?  checkAuthEvent,TResult? Function( _AuthStatusChanged value)?  authStatusChanged,TResult? Function( RegisterUser value)?  registerUserEvent,TResult? Function( LoginUser value)?  loginUserEvent,TResult? Function( RegisterUserSuccess value)?  registerUserSuccessEvent,TResult? Function( LogoutUser value)?  logoutEvent,}){
final _that = this;
switch (_that) {
case CheckAuth() when checkAuthEvent != null:
return checkAuthEvent(_that);case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that);case RegisterUser() when registerUserEvent != null:
return registerUserEvent(_that);case LoginUser() when loginUserEvent != null:
return loginUserEvent(_that);case RegisterUserSuccess() when registerUserSuccessEvent != null:
return registerUserSuccessEvent(_that);case LogoutUser() when logoutEvent != null:
return logoutEvent(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthEvent,TResult Function( supabase.User? user)?  authStatusChanged,TResult Function( User user)?  registerUserEvent,TResult Function( String email,  String password)?  loginUserEvent,TResult Function( User user)?  registerUserSuccessEvent,TResult Function()?  logoutEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckAuth() when checkAuthEvent != null:
return checkAuthEvent();case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that.user);case RegisterUser() when registerUserEvent != null:
return registerUserEvent(_that.user);case LoginUser() when loginUserEvent != null:
return loginUserEvent(_that.email,_that.password);case RegisterUserSuccess() when registerUserSuccessEvent != null:
return registerUserSuccessEvent(_that.user);case LogoutUser() when logoutEvent != null:
return logoutEvent();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthEvent,required TResult Function( supabase.User? user)  authStatusChanged,required TResult Function( User user)  registerUserEvent,required TResult Function( String email,  String password)  loginUserEvent,required TResult Function( User user)  registerUserSuccessEvent,required TResult Function()  logoutEvent,}) {final _that = this;
switch (_that) {
case CheckAuth():
return checkAuthEvent();case _AuthStatusChanged():
return authStatusChanged(_that.user);case RegisterUser():
return registerUserEvent(_that.user);case LoginUser():
return loginUserEvent(_that.email,_that.password);case RegisterUserSuccess():
return registerUserSuccessEvent(_that.user);case LogoutUser():
return logoutEvent();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthEvent,TResult? Function( supabase.User? user)?  authStatusChanged,TResult? Function( User user)?  registerUserEvent,TResult? Function( String email,  String password)?  loginUserEvent,TResult? Function( User user)?  registerUserSuccessEvent,TResult? Function()?  logoutEvent,}) {final _that = this;
switch (_that) {
case CheckAuth() when checkAuthEvent != null:
return checkAuthEvent();case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that.user);case RegisterUser() when registerUserEvent != null:
return registerUserEvent(_that.user);case LoginUser() when loginUserEvent != null:
return loginUserEvent(_that.email,_that.password);case RegisterUserSuccess() when registerUserSuccessEvent != null:
return registerUserSuccessEvent(_that.user);case LogoutUser() when logoutEvent != null:
return logoutEvent();case _:
  return null;

}
}

}

/// @nodoc


class CheckAuth implements AuthEvent {
  const CheckAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuthEvent()';
}


}




/// @nodoc


class _AuthStatusChanged implements AuthEvent {
  const _AuthStatusChanged(this.user);
  

 final  supabase.User? user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStatusChangedCopyWith<_AuthStatusChanged> get copyWith => __$AuthStatusChangedCopyWithImpl<_AuthStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusChanged&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.authStatusChanged(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthStatusChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthStatusChangedCopyWith(_AuthStatusChanged value, $Res Function(_AuthStatusChanged) _then) = __$AuthStatusChangedCopyWithImpl;
@useResult
$Res call({
 supabase.User? user
});




}
/// @nodoc
class __$AuthStatusChangedCopyWithImpl<$Res>
    implements _$AuthStatusChangedCopyWith<$Res> {
  __$AuthStatusChangedCopyWithImpl(this._self, this._then);

  final _AuthStatusChanged _self;
  final $Res Function(_AuthStatusChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_AuthStatusChanged(
freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as supabase.User?,
  ));
}


}

/// @nodoc


class RegisterUser implements AuthEvent {
  const RegisterUser({required this.user});
  

 final  User user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserCopyWith<RegisterUser> get copyWith => _$RegisterUserCopyWithImpl<RegisterUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.registerUserEvent(user: $user)';
}


}

/// @nodoc
abstract mixin class $RegisterUserCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterUserCopyWith(RegisterUser value, $Res Function(RegisterUser) _then) = _$RegisterUserCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$RegisterUserCopyWithImpl<$Res>
    implements $RegisterUserCopyWith<$Res> {
  _$RegisterUserCopyWithImpl(this._self, this._then);

  final RegisterUser _self;
  final $Res Function(RegisterUser) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(RegisterUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class LoginUser implements AuthEvent {
  const LoginUser({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUserCopyWith<LoginUser> get copyWith => _$LoginUserCopyWithImpl<LoginUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUser&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginUserEvent(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginUserCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginUserCopyWith(LoginUser value, $Res Function(LoginUser) _then) = _$LoginUserCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginUserCopyWithImpl<$Res>
    implements $LoginUserCopyWith<$Res> {
  _$LoginUserCopyWithImpl(this._self, this._then);

  final LoginUser _self;
  final $Res Function(LoginUser) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginUser(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterUserSuccess implements AuthEvent {
  const RegisterUserSuccess({required this.user});
  

 final  User user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserSuccessCopyWith<RegisterUserSuccess> get copyWith => _$RegisterUserSuccessCopyWithImpl<RegisterUserSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUserSuccess&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.registerUserSuccessEvent(user: $user)';
}


}

/// @nodoc
abstract mixin class $RegisterUserSuccessCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterUserSuccessCopyWith(RegisterUserSuccess value, $Res Function(RegisterUserSuccess) _then) = _$RegisterUserSuccessCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$RegisterUserSuccessCopyWithImpl<$Res>
    implements $RegisterUserSuccessCopyWith<$Res> {
  _$RegisterUserSuccessCopyWithImpl(this._self, this._then);

  final RegisterUserSuccess _self;
  final $Res Function(RegisterUserSuccess) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(RegisterUserSuccess(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class LogoutUser implements AuthEvent {
  const LogoutUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutEvent()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _Authenticated value)?  authenticated,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Unauthenticated():
return unauthenticated(_that);case _Authenticated():
return authenticated(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  unauthenticated,TResult Function( User user)?  authenticated,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _Error() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  unauthenticated,required TResult Function( User user)  authenticated,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Unauthenticated():
return unauthenticated();case _Authenticated():
return authenticated(_that.user);case _Error():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  unauthenticated,TResult? Function( User user)?  authenticated,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _Unauthenticated implements AuthState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class _Authenticated implements AuthState {
  const _Authenticated({required this.user});
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedCopyWith<_Authenticated> get copyWith => __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(_Authenticated value, $Res Function(_Authenticated) _then) = __$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Authenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Error implements AuthState {
  const _Error({required this.error});
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
