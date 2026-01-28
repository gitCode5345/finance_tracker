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
        .or('user_id.eq.${user!.id},user_id.is.null');

    return data.map((e) => Category.fromJson(e)).toList();
  }
}
