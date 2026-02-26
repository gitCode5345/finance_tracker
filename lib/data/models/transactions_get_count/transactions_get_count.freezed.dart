// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_get_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionsGetCount {

 int get firstPage; int get lastPage;
/// Create a copy of TransactionsGetCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsGetCountCopyWith<TransactionsGetCount> get copyWith => _$TransactionsGetCountCopyWithImpl<TransactionsGetCount>(this as TransactionsGetCount, _$identity);

  /// Serializes this TransactionsGetCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsGetCount&&(identical(other.firstPage, firstPage) || other.firstPage == firstPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstPage,lastPage);

@override
String toString() {
  return 'TransactionsGetCount(firstPage: $firstPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class $TransactionsGetCountCopyWith<$Res>  {
  factory $TransactionsGetCountCopyWith(TransactionsGetCount value, $Res Function(TransactionsGetCount) _then) = _$TransactionsGetCountCopyWithImpl;
@useResult
$Res call({
 int firstPage, int lastPage
});




}
/// @nodoc
class _$TransactionsGetCountCopyWithImpl<$Res>
    implements $TransactionsGetCountCopyWith<$Res> {
  _$TransactionsGetCountCopyWithImpl(this._self, this._then);

  final TransactionsGetCount _self;
  final $Res Function(TransactionsGetCount) _then;

/// Create a copy of TransactionsGetCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstPage = null,Object? lastPage = null,}) {
  return _then(_self.copyWith(
firstPage: null == firstPage ? _self.firstPage : firstPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionsGetCount].
extension TransactionsGetCountPatterns on TransactionsGetCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionsGetCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionsGetCount() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionsGetCount value)  $default,){
final _that = this;
switch (_that) {
case _TransactionsGetCount():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionsGetCount value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionsGetCount() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int firstPage,  int lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionsGetCount() when $default != null:
return $default(_that.firstPage,_that.lastPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int firstPage,  int lastPage)  $default,) {final _that = this;
switch (_that) {
case _TransactionsGetCount():
return $default(_that.firstPage,_that.lastPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int firstPage,  int lastPage)?  $default,) {final _that = this;
switch (_that) {
case _TransactionsGetCount() when $default != null:
return $default(_that.firstPage,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TransactionsGetCount implements TransactionsGetCount {
  const _TransactionsGetCount({required this.firstPage, required this.lastPage});
  factory _TransactionsGetCount.fromJson(Map<String, dynamic> json) => _$TransactionsGetCountFromJson(json);

@override final  int firstPage;
@override final  int lastPage;

/// Create a copy of TransactionsGetCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsGetCountCopyWith<_TransactionsGetCount> get copyWith => __$TransactionsGetCountCopyWithImpl<_TransactionsGetCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionsGetCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsGetCount&&(identical(other.firstPage, firstPage) || other.firstPage == firstPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstPage,lastPage);

@override
String toString() {
  return 'TransactionsGetCount(firstPage: $firstPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$TransactionsGetCountCopyWith<$Res> implements $TransactionsGetCountCopyWith<$Res> {
  factory _$TransactionsGetCountCopyWith(_TransactionsGetCount value, $Res Function(_TransactionsGetCount) _then) = __$TransactionsGetCountCopyWithImpl;
@override @useResult
$Res call({
 int firstPage, int lastPage
});




}
/// @nodoc
class __$TransactionsGetCountCopyWithImpl<$Res>
    implements _$TransactionsGetCountCopyWith<$Res> {
  __$TransactionsGetCountCopyWithImpl(this._self, this._then);

  final _TransactionsGetCount _self;
  final $Res Function(_TransactionsGetCount) _then;

/// Create a copy of TransactionsGetCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstPage = null,Object? lastPage = null,}) {
  return _then(_TransactionsGetCount(
firstPage: null == firstPage ? _self.firstPage : firstPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
