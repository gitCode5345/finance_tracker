part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.loaded(List<Category> categories) = Loaded;
  const factory CategoryState.error(String message) = Error;
}
