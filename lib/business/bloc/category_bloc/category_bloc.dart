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
  }
  Future<void> onLoadCategories(LoadCategories e, Emitter emit) async {
    try {
      emit(_Loading());
      final data = await categoryService.getAllCategories();
      emit(_Loaded(data));
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }
}
