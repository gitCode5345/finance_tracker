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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( GetTransactionsEvent value)?  getTransactions,TResult Function( GetTransactionsByCategoryEvent value)?  getTransactionsByCategory,TResult Function( LoadingTransactionsEvent value)?  loadingTransactions,TResult Function( SaveTransactionEvent value)?  saveTransaction,TResult Function( RefreshTransactionsEvent value)?  refreshTransactions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that);case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions(_that);case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that);case RefreshTransactionsEvent() when refreshTransactions != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( GetTransactionsEvent value)  getTransactions,required TResult Function( GetTransactionsByCategoryEvent value)  getTransactionsByCategory,required TResult Function( LoadingTransactionsEvent value)  loadingTransactions,required TResult Function( SaveTransactionEvent value)  saveTransaction,required TResult Function( RefreshTransactionsEvent value)  refreshTransactions,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case GetTransactionsEvent():
return getTransactions(_that);case GetTransactionsByCategoryEvent():
return getTransactionsByCategory(_that);case LoadingTransactionsEvent():
return loadingTransactions(_that);case SaveTransactionEvent():
return saveTransaction(_that);case RefreshTransactionsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( GetTransactionsEvent value)?  getTransactions,TResult? Function( GetTransactionsByCategoryEvent value)?  getTransactionsByCategory,TResult? Function( LoadingTransactionsEvent value)?  loadingTransactions,TResult? Function( SaveTransactionEvent value)?  saveTransaction,TResult? Function( RefreshTransactionsEvent value)?  refreshTransactions,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that);case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions(_that);case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that);case RefreshTransactionsEvent() when refreshTransactions != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String period)?  getTransactions,TResult Function( String categoryId,  String period)?  getTransactionsByCategory,TResult Function()?  loadingTransactions,TResult Function( Transaction transaction)?  saveTransaction,TResult Function()?  refreshTransactions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that.period);case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that.categoryId,_that.period);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions();case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that.transaction);case RefreshTransactionsEvent() when refreshTransactions != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String period)  getTransactions,required TResult Function( String categoryId,  String period)  getTransactionsByCategory,required TResult Function()  loadingTransactions,required TResult Function( Transaction transaction)  saveTransaction,required TResult Function()  refreshTransactions,}) {final _that = this;
switch (_that) {
case _Started():
return started();case GetTransactionsEvent():
return getTransactions(_that.period);case GetTransactionsByCategoryEvent():
return getTransactionsByCategory(_that.categoryId,_that.period);case LoadingTransactionsEvent():
return loadingTransactions();case SaveTransactionEvent():
return saveTransaction(_that.transaction);case RefreshTransactionsEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String period)?  getTransactions,TResult? Function( String categoryId,  String period)?  getTransactionsByCategory,TResult? Function()?  loadingTransactions,TResult? Function( Transaction transaction)?  saveTransaction,TResult? Function()?  refreshTransactions,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case GetTransactionsEvent() when getTransactions != null:
return getTransactions(_that.period);case GetTransactionsByCategoryEvent() when getTransactionsByCategory != null:
return getTransactionsByCategory(_that.categoryId,_that.period);case LoadingTransactionsEvent() when loadingTransactions != null:
return loadingTransactions();case SaveTransactionEvent() when saveTransaction != null:
return saveTransaction(_that.transaction);case RefreshTransactionsEvent() when refreshTransactions != null:
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
  const GetTransactionsEvent({required this.period});
  

 final  String period;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTransactionsEventCopyWith<GetTransactionsEvent> get copyWith => _$GetTransactionsEventCopyWithImpl<GetTransactionsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTransactionsEvent&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,period);

@override
String toString() {
  return 'TransactionsEvent.getTransactions(period: $period)';
}


}

/// @nodoc
abstract mixin class $GetTransactionsEventCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $GetTransactionsEventCopyWith(GetTransactionsEvent value, $Res Function(GetTransactionsEvent) _then) = _$GetTransactionsEventCopyWithImpl;
@useResult
$Res call({
 String period
});




}
/// @nodoc
class _$GetTransactionsEventCopyWithImpl<$Res>
    implements $GetTransactionsEventCopyWith<$Res> {
  _$GetTransactionsEventCopyWithImpl(this._self, this._then);

  final GetTransactionsEvent _self;
  final $Res Function(GetTransactionsEvent) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,}) {
  return _then(GetTransactionsEvent(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Updated value)?  updated,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Updated() when updated != null:
return updated(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Updated value)  updated,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Updated():
return updated(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Updated value)?  updated,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Updated() when updated != null:
return updated(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String? currentPeriod,  List<Transaction>? transactions)?  loading,TResult Function( List<Transaction> transactions,  String? currentPeriod)?  updated,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.currentPeriod,_that.transactions);case Updated() when updated != null:
return updated(_that.transactions,_that.currentPeriod);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String? currentPeriod,  List<Transaction>? transactions)  loading,required TResult Function( List<Transaction> transactions,  String? currentPeriod)  updated,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading(_that.currentPeriod,_that.transactions);case Updated():
return updated(_that.transactions,_that.currentPeriod);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String? currentPeriod,  List<Transaction>? transactions)?  loading,TResult? Function( List<Transaction> transactions,  String? currentPeriod)?  updated,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.currentPeriod,_that.transactions);case Updated() when updated != null:
return updated(_that.transactions,_that.currentPeriod);case Error() when error != null:
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
  const Loading({this.currentPeriod, final  List<Transaction>? transactions}): _transactions = transactions;
  

 final  String? currentPeriod;
 final  List<Transaction>? _transactions;
 List<Transaction>? get transactions {
  final value = _transactions;
  if (value == null) return null;
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.currentPeriod, currentPeriod) || other.currentPeriod == currentPeriod)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}


@override
int get hashCode => Object.hash(runtimeType,currentPeriod,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'TransactionsState.loading(currentPeriod: $currentPeriod, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@useResult
$Res call({
 String? currentPeriod, List<Transaction>? transactions
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
@pragma('vm:prefer-inline') $Res call({Object? currentPeriod = freezed,Object? transactions = freezed,}) {
  return _then(Loading(
currentPeriod: freezed == currentPeriod ? _self.currentPeriod : currentPeriod // ignore: cast_nullable_to_non_nullable
as String?,transactions: freezed == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>?,
  ));
}


}

/// @nodoc


class Updated implements TransactionsState {
  const Updated(final  List<Transaction> transactions, {this.currentPeriod}): _transactions = transactions;
  

 final  List<Transaction> _transactions;
 List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

 final  String? currentPeriod;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedCopyWith<Updated> get copyWith => _$UpdatedCopyWithImpl<Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Updated&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.currentPeriod, currentPeriod) || other.currentPeriod == currentPeriod));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions),currentPeriod);

@override
String toString() {
  return 'TransactionsState.updated(transactions: $transactions, currentPeriod: $currentPeriod)';
}


}

/// @nodoc
abstract mixin class $UpdatedCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $UpdatedCopyWith(Updated value, $Res Function(Updated) _then) = _$UpdatedCopyWithImpl;
@useResult
$Res call({
 List<Transaction> transactions, String? currentPeriod
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
@pragma('vm:prefer-inline') $Res call({Object? transactions = null,Object? currentPeriod = freezed,}) {
  return _then(Updated(
null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,currentPeriod: freezed == currentPeriod ? _self.currentPeriod : currentPeriod // ignore: cast_nullable_to_non_nullable
as String?,
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
