import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/categories_repository.dart';

class GetCategoriesBySCategory {
  final CategoriesRepository categoriesRepository;

  GetCategoriesBySCategory(this.categoriesRepository);

  Future<List<Category>> call(SCategory sCategory) async {
    return await categoriesRepository.getSCategories(sCategory);
  }
}
