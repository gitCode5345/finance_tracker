part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.started() = _Started;
  const factory CategoryEvent.loadCategories() = LoadCategories;
  const factory CategoryEvent.addCategory(Category category) = AddCategoryEvent;
  const factory CategoryEvent.deleteCategory(String categoryId) = DeleteCategoryEvent;
  const factory CategoryEvent.updateCategory(Category category) = UpdateCategoryEvent;
}
