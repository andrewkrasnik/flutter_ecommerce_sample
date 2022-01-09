import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/category_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoryDataSource categoryDataSource;

  CategoriesRepositoryImpl(this.categoryDataSource);

  @override
  Future<List<Category>> getAllCategories() async {
    return await categoryDataSource.getAllCategories();
  }

  @override
  Future<Category> getCategoryById(int categoryId) async {
    return await categoryDataSource.getCategoryById(categoryId);
  }

  @override
  Future<List<Category>> getSCategories(SCategory sCategory) async {
    return await categoryDataSource.getSCategories(sCategory);
  }
}
