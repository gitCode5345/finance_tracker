import 'package:finance_tracker/data/services/category/category_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_tracker/data/models/category/category.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService categoryService;
  
  CategoryBloc({required this.categoryService}) : super(_Initial()) {
    on<LoadCategories>(onLoadCategories);
    on<AddCategoryEvent>(onAddCategory);
    on<DeleteCategoryEvent>(onDeleteCategory);
  }
  Future<void> onLoadCategories(LoadCategories e, Emitter emit) async {
    try {
      emit(Loading());
      final data = await categoryService.getAllCategories();
      emit(Loaded(data));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> onAddCategory(AddCategoryEvent e, Emitter emit) async {
    try {
      await categoryService.addCategory(e.category);
      add(const LoadCategories());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> onDeleteCategory(DeleteCategoryEvent e, Emitter emit) async {
    try {
      await categoryService.deleteCategory(e.categoryId);
      add(const LoadCategories());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
