import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getAllCategories();
  Future<List<Category>> getSCategories(SCategory sCategory);
  Future<Category> getCategoryById(int categoryId);
}
