import 'package:finance_tracker/data/models/category/category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryService {
  SupabaseClient get _client => Supabase.instance.client;
  User? get user => _client.auth.currentUser;

  Future<List<Category>> getAllCategories() async {
    if (user == null) return [];

    final data = await _client
        .from('Categories')
        .select()
        .or('user_id.eq.${user!.id}, user_id.is.null');

    return data.map((e) => Category.fromJson(e)).toList();
  }

  Future<void> addCategory(Category category) async {
    if (user == null) return;

    await _client.from('Categories').insert({
      'name': category.name,
      'type': category.type,
      'is_system': category.isSystem,
      'icon': category.icon,
      'user_id': user!.id,
    });
  }

  Future<void> deleteCategory(String categoryId) async {
    if (user == null) return;

    await _client.from('Categories')
      .delete()
      .eq('id', categoryId)
      .eq('user_id', user!.id);
  }
}
