part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.started() = _Started;
  const factory CategoryEvent.loadCategories() = LoadCategories;
  const factory CategoryEvent.addCategory(Category category) = _AddCategory;
  const factory CategoryEvent.deleteCategory(String categoryId) = _DeleteCategory;
  const factory CategoryEvent.updateCategory(Category category) = _UpdateCategory;
}
