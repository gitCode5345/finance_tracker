// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent()';
}


}

/// @nodoc
class $TransactionsEventCopyWith<$Res>  {
$TransactionsEventCopyWith(TransactionsEvent _, $Res Function(TransactionsEvent) __);
}


/// Adds pattern-matching-related methods to [TransactionsEvent].
extension TransactionsEventPatterns on TransactionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( GetTransactionsEvent value)?  getTransactions,TResult Function( GetTransactionsSilentEvent value)?  getTransactionsSilent,TResult Function( GetAllTransactionsEvent value)?  getAllTransactions,TResult Function( GetTransactionsByCategoryEvent value)?  getTransactionsByCategory,TResult Function( LoadingTransactionsEvent value)?  loadingTransactions,TResult Function( SaveTransactionEvent value)?  saveTransaction,TResult Function( GetTransactionsByTypeEvent value)?  getTransactionsByType,TResult Function( GetTransactionsByTypeSilentEvent value)?  getTransactionsByTypeSilent,TResult Function( LoadMoreTransactionsEvent value)?  loadMoreTransactions,TResult Function( RefreshTransactionsEvent value)?  refreshTransactions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that);case GetTransactionsSilentEvent() when getTransactionsSilent != null:
return getTransactionsSilent(_that);case GetAllTransactionsEvent() when getAllTransactions != null:
return getAllTransactions(_that);case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions(_that);case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that);case GetTransactionsByTypeEvent() when getTransactionsByType != null:
return getTransactionsByType(_that);case GetTransactionsByTypeSilentEvent() when getTransactionsByTypeSilent != null:
return getTransactionsByTypeSilent(_that);case LoadMoreTransactionsEvent() when loadMoreTransactions != null:
return loadMoreTransactions(_that);case RefreshTransactionsEvent() when refreshTransactions != null:
return refreshTransactions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( GetTransactionsEvent value)  getTransactions,required TResult Function( GetTransactionsSilentEvent value)  getTransactionsSilent,required TResult Function( GetAllTransactionsEvent value)  getAllTransactions,required TResult Function( GetTransactionsByCategoryEvent value)  getTransactionsByCategory,required TResult Function( LoadingTransactionsEvent value)  loadingTransactions,required TResult Function( SaveTransactionEvent value)  saveTransaction,required TResult Function( GetTransactionsByTypeEvent value)  getTransactionsByType,required TResult Function( GetTransactionsByTypeSilentEvent value)  getTransactionsByTypeSilent,required TResult Function( LoadMoreTransactionsEvent value)  loadMoreTransactions,required TResult Function( RefreshTransactionsEvent value)  refreshTransactions,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case GetTransactionsEvent():
return getTransactions(_that);case GetTransactionsSilentEvent():
return getTransactionsSilent(_that);case GetAllTransactionsEvent():
return getAllTransactions(_that);case GetTransactionsByCategoryEvent():
return getTransactionsByCategory(_that);case LoadingTransactionsEvent():
return loadingTransactions(_that);case SaveTransactionEvent():
return saveTransaction(_that);case GetTransactionsByTypeEvent():
return getTransactionsByType(_that);case GetTransactionsByTypeSilentEvent():
return getTransactionsByTypeSilent(_that);case LoadMoreTransactionsEvent():
return loadMoreTransactions(_that);case RefreshTransactionsEvent():
return refreshTransactions(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( GetTransactionsEvent value)?  getTransactions,TResult? Function( GetTransactionsSilentEvent value)?  getTransactionsSilent,TResult? Function( GetAllTransactionsEvent value)?  getAllTransactions,TResult? Function( GetTransactionsByCategoryEvent value)?  getTransactionsByCategory,TResult? Function( LoadingTransactionsEvent value)?  loadingTransactions,TResult? Function( SaveTransactionEvent value)?  saveTransaction,TResult? Function( GetTransactionsByTypeEvent value)?  getTransactionsByType,TResult? Function( GetTransactionsByTypeSilentEvent value)?  getTransactionsByTypeSilent,TResult? Function( LoadMoreTransactionsEvent value)?  loadMoreTransactions,TResult? Function( RefreshTransactionsEvent value)?  refreshTransactions,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that);case GetTransactionsSilentEvent() when getTransactionsSilent != null:
return getTransactionsSilent(_that);case GetAllTransactionsEvent() when getAllTransactions != null:
return getAllTransactions(_that);case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions(_that);case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that);case GetTransactionsByTypeEvent() when getTransactionsByType != null:
return getTransactionsByType(_that);case GetTransactionsByTypeSilentEvent() when getTransactionsByTypeSilent != null:
return getTransactionsByTypeSilent(_that);case LoadMoreTransactionsEvent() when loadMoreTransactions != null:
return loadMoreTransactions(_that);case RefreshTransactionsEvent() when refreshTransactions != null:
return refreshTransactions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String period,  TransactionsGetCount? count)?  getTransactions,TResult Function( String period,  TransactionsGetCount? count)?  getTransactionsSilent,TResult Function()?  getAllTransactions,TResult Function( String categoryId,  String period)?  getTransactionsByCategory,TResult Function()?  loadingTransactions,TResult Function( Transaction transaction)?  saveTransaction,TResult Function( String type,  String? period)?  getTransactionsByType,TResult Function( String type,  String? period,  TransactionsGetCount? count)?  getTransactionsByTypeSilent,TResult Function()?  loadMoreTransactions,TResult Function()?  refreshTransactions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that.period,_that.count);case GetTransactionsSilentEvent() when getTransactionsSilent != null:
return getTransactionsSilent(_that.period,_that.count);case GetAllTransactionsEvent() when getAllTransactions != null:
return getAllTransactions();case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that.categoryId,_that.period);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions();case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that.transaction);case GetTransactionsByTypeEvent() when getTransactionsByType != null:
return getTransactionsByType(_that.type,_that.period);case GetTransactionsByTypeSilentEvent() when getTransactionsByTypeSilent != null:
return getTransactionsByTypeSilent(_that.type,_that.period,_that.count);case LoadMoreTransactionsEvent() when loadMoreTransactions != null:
return loadMoreTransactions();case RefreshTransactionsEvent() when refreshTransactions != null:
return refreshTransactions();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String period,  TransactionsGetCount? count)  getTransactions,required TResult Function( String period,  TransactionsGetCount? count)  getTransactionsSilent,required TResult Function()  getAllTransactions,required TResult Function( String categoryId,  String period)  getTransactionsByCategory,required TResult Function()  loadingTransactions,required TResult Function( Transaction transaction)  saveTransaction,required TResult Function( String type,  String? period)  getTransactionsByType,required TResult Function( String type,  String? period,  TransactionsGetCount? count)  getTransactionsByTypeSilent,required TResult Function()  loadMoreTransactions,required TResult Function()  refreshTransactions,}) {final _that = this;
switch (_that) {
case _Started():
return started();case GetTransactionsEvent():
return getTransactions(_that.period,_that.count);case GetTransactionsSilentEvent():
return getTransactionsSilent(_that.period,_that.count);case GetAllTransactionsEvent():
return getAllTransactions();case GetTransactionsByCategoryEvent():
return getTransactionsByCategory(_that.categoryId,_that.period);case LoadingTransactionsEvent():
return loadingTransactions();case SaveTransactionEvent():
return saveTransaction(_that.transaction);case GetTransactionsByTypeEvent():
return getTransactionsByType(_that.type,_that.period);case GetTransactionsByTypeSilentEvent():
return getTransactionsByTypeSilent(_that.type,_that.period,_that.count);case LoadMoreTransactionsEvent():
return loadMoreTransactions();case RefreshTransactionsEvent():
return refreshTransactions();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String period,  TransactionsGetCount? count)?  getTransactions,TResult? Function( String period,  TransactionsGetCount? count)?  getTransactionsSilent,TResult? Function()?  getAllTransactions,TResult? Function( String categoryId,  String period)?  getTransactionsByCategory,TResult? Function()?  loadingTransactions,TResult? Function( Transaction transaction)?  saveTransaction,TResult? Function( String type,  String? period)?  getTransactionsByType,TResult? Function( String type,  String? period,  TransactionsGetCount? count)?  getTransactionsByTypeSilent,TResult? Function()?  loadMoreTransactions,TResult? Function()?  refreshTransactions,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that.period,_that.count);case GetTransactionsSilentEvent() when getTransactionsSilent != null:
return getTransactionsSilent(_that.period,_that.count);case GetAllTransactionsEvent() when getAllTransactions != null:
return getAllTransactions();case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that.categoryId,_that.period);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions();case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that.transaction);case GetTransactionsByTypeEvent() when getTransactionsByType != null:
return getTransactionsByType(_that.type,_that.period);case GetTransactionsByTypeSilentEvent() when getTransactionsByTypeSilent != null:
return getTransactionsByTypeSilent(_that.type,_that.period,_that.count);case LoadMoreTransactionsEvent() when loadMoreTransactions != null:
return loadMoreTransactions();case RefreshTransactionsEvent() when refreshTransactions != null:
return refreshTransactions();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TransactionsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.started()';
}


}




/// @nodoc


class GetTransactionsEvent implements TransactionsEvent {
  const GetTransactionsEvent({required this.period, this.count});
  

 final  String period;
 final  TransactionsGetCount? count;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTransactionsEventCopyWith<GetTransactionsEvent> get copyWith => _$GetTransactionsEventCopyWithImpl<GetTransactionsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTransactionsEvent&&(identical(other.period, period) || other.period == period)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,period,count);

@override
String toString() {
  return 'TransactionsEvent.getTransactions(period: $period, count: $count)';
}


}

/// @nodoc
abstract mixin class $GetTransactionsEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $GetTransactionsEventCopyWith(GetTransactionsEvent value, $Res Function(GetTransactionsEvent) _then) = _$GetTransactionsEventCopyWithImpl;
@useResult
$Res call({
 String period, TransactionsGetCount? count
});


$TransactionsGetCountCopyWith<$Res>? get count;

}
/// @nodoc
class _$GetTransactionsEventCopyWithImpl<$Res>
    implements $GetTransactionsEventCopyWith<$Res> {
  _$GetTransactionsEventCopyWithImpl(this._self, this._then);

  final GetTransactionsEvent _self;
  final $Res Function(GetTransactionsEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,Object? count = freezed,}) {
  return _then(GetTransactionsEvent(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as TransactionsGetCount?,
  ));
}

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionsGetCountCopyWith<$Res>? get count {
    if (_self.count == null) {
    return null;
  }

  return $TransactionsGetCountCopyWith<$Res>(_self.count!, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}

/// @nodoc


class GetTransactionsSilentEvent implements TransactionsEvent {
  const GetTransactionsSilentEvent({required this.period, this.count});
  

 final  String period;
 final  TransactionsGetCount? count;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTransactionsSilentEventCopyWith<GetTransactionsSilentEvent> get copyWith => _$GetTransactionsSilentEventCopyWithImpl<GetTransactionsSilentEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTransactionsSilentEvent&&(identical(other.period, period) || other.period == period)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,period,count);

@override
String toString() {
  return 'TransactionsEvent.getTransactionsSilent(period: $period, count: $count)';
}


}

/// @nodoc
abstract mixin class $GetTransactionsSilentEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $GetTransactionsSilentEventCopyWith(GetTransactionsSilentEvent value, $Res Function(GetTransactionsSilentEvent) _then) = _$GetTransactionsSilentEventCopyWithImpl;
@useResult
$Res call({
 String period, TransactionsGetCount? count
});


$TransactionsGetCountCopyWith<$Res>? get count;

}
/// @nodoc
class _$GetTransactionsSilentEventCopyWithImpl<$Res>
    implements $GetTransactionsSilentEventCopyWith<$Res> {
  _$GetTransactionsSilentEventCopyWithImpl(this._self, this._then);

  final GetTransactionsSilentEvent _self;
  final $Res Function(GetTransactionsSilentEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,Object? count = freezed,}) {
  return _then(GetTransactionsSilentEvent(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as TransactionsGetCount?,
  ));
}

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionsGetCountCopyWith<$Res>? get count {
    if (_self.count == null) {
    return null;
  }

  return $TransactionsGetCountCopyWith<$Res>(_self.count!, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}

/// @nodoc


class GetAllTransactionsEvent implements TransactionsEvent {
  const GetAllTransactionsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllTransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.getAllTransactions()';
}


}




/// @nodoc


class GetTransactionsByCategoryEvent implements TransactionsEvent {
  const GetTransactionsByCategoryEvent({required this.categoryId, this.period = ''});
  

 final  String categoryId;
@JsonKey() final  String period;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTransactionsByCategoryEventCopyWith<GetTransactionsByCategoryEvent> get copyWith => _$GetTransactionsByCategoryEventCopyWithImpl<GetTransactionsByCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTransactionsByCategoryEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,period);

@override
String toString() {
  return 'TransactionsEvent.getTransactionsByCategory(categoryId: $categoryId, period: $period)';
}


}

/// @nodoc
abstract mixin class $GetTransactionsByCategoryEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $GetTransactionsByCategoryEventCopyWith(GetTransactionsByCategoryEvent value, $Res Function(GetTransactionsByCategoryEvent) _then) = _$GetTransactionsByCategoryEventCopyWithImpl;
@useResult
$Res call({
 String categoryId, String period
});




}
/// @nodoc
class _$GetTransactionsByCategoryEventCopyWithImpl<$Res>
    implements $GetTransactionsByCategoryEventCopyWith<$Res> {
  _$GetTransactionsByCategoryEventCopyWithImpl(this._self, this._then);

  final GetTransactionsByCategoryEvent _self;
  final $Res Function(GetTransactionsByCategoryEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? period = null,}) {
  return _then(GetTransactionsByCategoryEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadingTransactionsEvent implements TransactionsEvent {
  const LoadingTransactionsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingTransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.loadingTransactions()';
}


}




/// @nodoc


class SaveTransactionEvent implements TransactionsEvent {
  const SaveTransactionEvent({required this.transaction});
  

 final  Transaction transaction;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveTransactionEventCopyWith<SaveTransactionEvent> get copyWith => _$SaveTransactionEventCopyWithImpl<SaveTransactionEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveTransactionEvent&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'TransactionsEvent.saveTransaction(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $SaveTransactionEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $SaveTransactionEventCopyWith(SaveTransactionEvent value, $Res Function(SaveTransactionEvent) _then) = _$SaveTransactionEventCopyWithImpl;
@useResult
$Res call({
 Transaction transaction
});


$TransactionCopyWith<$Res> get transaction;

}
/// @nodoc
class _$SaveTransactionEventCopyWithImpl<$Res>
    implements $SaveTransactionEventCopyWith<$Res> {
  _$SaveTransactionEventCopyWithImpl(this._self, this._then);

  final SaveTransactionEvent _self;
  final $Res Function(SaveTransactionEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(SaveTransactionEvent(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,
  ));
}

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res> get transaction {
  
  return $TransactionCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}
}

/// @nodoc


class GetTransactionsByTypeEvent implements TransactionsEvent {
  const GetTransactionsByTypeEvent({required this.type, this.period});
  

 final  String type;
 final  String? period;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTransactionsByTypeEventCopyWith<GetTransactionsByTypeEvent> get copyWith => _$GetTransactionsByTypeEventCopyWithImpl<GetTransactionsByTypeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTransactionsByTypeEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,type,period);

@override
String toString() {
  return 'TransactionsEvent.getTransactionsByType(type: $type, period: $period)';
}


}

/// @nodoc
abstract mixin class $GetTransactionsByTypeEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $GetTransactionsByTypeEventCopyWith(GetTransactionsByTypeEvent value, $Res Function(GetTransactionsByTypeEvent) _then) = _$GetTransactionsByTypeEventCopyWithImpl;
@useResult
$Res call({
 String type, String? period
});




}
/// @nodoc
class _$GetTransactionsByTypeEventCopyWithImpl<$Res>
    implements $GetTransactionsByTypeEventCopyWith<$Res> {
  _$GetTransactionsByTypeEventCopyWithImpl(this._self, this._then);

  final GetTransactionsByTypeEvent _self;
  final $Res Function(GetTransactionsByTypeEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? period = freezed,}) {
  return _then(GetTransactionsByTypeEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class GetTransactionsByTypeSilentEvent implements TransactionsEvent {
  const GetTransactionsByTypeSilentEvent({required this.type, this.period, this.count});
  

 final  String type;
 final  String? period;
 final  TransactionsGetCount? count;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTransactionsByTypeSilentEventCopyWith<GetTransactionsByTypeSilentEvent> get copyWith => _$GetTransactionsByTypeSilentEventCopyWithImpl<GetTransactionsByTypeSilentEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTransactionsByTypeSilentEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.period, period) || other.period == period)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,type,period,count);

@override
String toString() {
  return 'TransactionsEvent.getTransactionsByTypeSilent(type: $type, period: $period, count: $count)';
}


}

/// @nodoc
abstract mixin class $GetTransactionsByTypeSilentEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $GetTransactionsByTypeSilentEventCopyWith(GetTransactionsByTypeSilentEvent value, $Res Function(GetTransactionsByTypeSilentEvent) _then) = _$GetTransactionsByTypeSilentEventCopyWithImpl;
@useResult
$Res call({
 String type, String? period, TransactionsGetCount? count
});


$TransactionsGetCountCopyWith<$Res>? get count;

}
/// @nodoc
class _$GetTransactionsByTypeSilentEventCopyWithImpl<$Res>
    implements $GetTransactionsByTypeSilentEventCopyWith<$Res> {
  _$GetTransactionsByTypeSilentEventCopyWithImpl(this._self, this._then);

  final GetTransactionsByTypeSilentEvent _self;
  final $Res Function(GetTransactionsByTypeSilentEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? period = freezed,Object? count = freezed,}) {
  return _then(GetTransactionsByTypeSilentEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as TransactionsGetCount?,
  ));
}

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionsGetCountCopyWith<$Res>? get count {
    if (_self.count == null) {
    return null;
  }

  return $TransactionsGetCountCopyWith<$Res>(_self.count!, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}

/// @nodoc


class LoadMoreTransactionsEvent implements TransactionsEvent {
  const LoadMoreTransactionsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreTransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.loadMoreTransactions()';
}


}




/// @nodoc


class RefreshTransactionsEvent implements TransactionsEvent {
  const RefreshTransactionsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.refreshTransactions()';
}


}




/// @nodoc
mixin _$TransactionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsState()';
}


}

/// @nodoc
class $TransactionsStateCopyWith<$Res>  {
$TransactionsStateCopyWith(TransactionsState _, $Res Function(TransactionsState) __);
}


/// Adds pattern-matching-related methods to [TransactionsState].
extension TransactionsStatePatterns on TransactionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Updated value)?  updated,TResult Function( SilentUpdated value)?  silentUpdated,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Updated() when updated != null:
return updated(_that);case SilentUpdated() when silentUpdated != null:
return silentUpdated(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Updated value)  updated,required TResult Function( SilentUpdated value)  silentUpdated,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Updated():
return updated(_that);case SilentUpdated():
return silentUpdated(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Updated value)?  updated,TResult? Function( SilentUpdated value)?  silentUpdated,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Updated() when updated != null:
return updated(_that);case SilentUpdated() when silentUpdated != null:
return silentUpdated(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( TransactionsView? view)?  loading,TResult Function( TransactionsView view)?  updated,TResult Function( TransactionsView view)?  silentUpdated,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.view);case Updated() when updated != null:
return updated(_that.view);case SilentUpdated() when silentUpdated != null:
return silentUpdated(_that.view);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( TransactionsView? view)  loading,required TResult Function( TransactionsView view)  updated,required TResult Function( TransactionsView view)  silentUpdated,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading(_that.view);case Updated():
return updated(_that.view);case SilentUpdated():
return silentUpdated(_that.view);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( TransactionsView? view)?  loading,TResult? Function( TransactionsView view)?  updated,TResult? Function( TransactionsView view)?  silentUpdated,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.view);case Updated() when updated != null:
return updated(_that.view);case SilentUpdated() when silentUpdated != null:
return silentUpdated(_that.view);case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TransactionsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsState.initial()';
}


}




/// @nodoc


class Loading implements TransactionsState {
  const Loading({this.view});
  

 final  TransactionsView? view;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString() {
  return 'TransactionsState.loading(view: $view)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@useResult
$Res call({
 TransactionsView? view
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? view = freezed,}) {
  return _then(Loading(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as TransactionsView?,
  ));
}


}

/// @nodoc


class Updated implements TransactionsState {
  const Updated(this.view);
  

 final  TransactionsView view;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedCopyWith<Updated> get copyWith => _$UpdatedCopyWithImpl<Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Updated&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString() {
  return 'TransactionsState.updated(view: $view)';
}


}

/// @nodoc
abstract mixin class $UpdatedCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $UpdatedCopyWith(Updated value, $Res Function(Updated) _then) = _$UpdatedCopyWithImpl;
@useResult
$Res call({
 TransactionsView view
});




}
/// @nodoc
class _$UpdatedCopyWithImpl<$Res>
    implements $UpdatedCopyWith<$Res> {
  _$UpdatedCopyWithImpl(this._self, this._then);

  final Updated _self;
  final $Res Function(Updated) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? view = null,}) {
  return _then(Updated(
null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as TransactionsView,
  ));
}


}

/// @nodoc


class SilentUpdated implements TransactionsState {
  const SilentUpdated(this.view);
  

 final  TransactionsView view;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SilentUpdatedCopyWith<SilentUpdated> get copyWith => _$SilentUpdatedCopyWithImpl<SilentUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SilentUpdated&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString() {
  return 'TransactionsState.silentUpdated(view: $view)';
}


}

/// @nodoc
abstract mixin class $SilentUpdatedCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $SilentUpdatedCopyWith(SilentUpdated value, $Res Function(SilentUpdated) _then) = _$SilentUpdatedCopyWithImpl;
@useResult
$Res call({
 TransactionsView view
});




}
/// @nodoc
class _$SilentUpdatedCopyWithImpl<$Res>
    implements $SilentUpdatedCopyWith<$Res> {
  _$SilentUpdatedCopyWithImpl(this._self, this._then);

  final SilentUpdated _self;
  final $Res Function(SilentUpdated) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? view = null,}) {
  return _then(SilentUpdated(
null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as TransactionsView,
  ));
}


}

/// @nodoc


class Error implements TransactionsState {
  const Error({required this.error});
  

 final  String error;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TransactionsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
