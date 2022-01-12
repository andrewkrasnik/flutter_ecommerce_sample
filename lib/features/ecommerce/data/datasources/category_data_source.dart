import 'package:flutter_ecommerce_sample/features/ecommerce/data/models/category_model.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getSCategories(SCategory sCategory);
  Future<CategoryModel> getCategoryById(int categoryId);
}

class CategoryDataSourceImpl implements CategoryDataSource {
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return getSCategories(SCategory.Woman);
  }

  @override
  Future<CategoryModel> getCategoryById(int categoryId) async {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> getSCategories(SCategory sCategory) async {
    List<CategoryModel> resultList = [];
    switch (sCategory) {
      case SCategory.Woman:
        resultList.add(CategoryModel(
            id: 1,
            name: "New",
            image: "assets/images/categories/new.png",
            sCategory: sCategory));
        resultList.add(CategoryModel(
            id: 2,
            name: "Clothes",
            image: "assets/images/categories/clothes.png",
            sCategory: sCategory));
        resultList.add(CategoryModel(
            id: 3,
            name: "Shoes",
            image: "assets/images/categories/shoes.png",
            sCategory: sCategory));
        resultList.add(CategoryModel(
            id: 4,
            name: "Accesories",
            image: "assets/images/categories/accesories.png",
            sCategory: sCategory));
        break;
      case SCategory.Men:
        resultList.add(CategoryModel(
            id: 5,
            name: "New",
            image: "assets/images/products/new_shirt.png",
            sCategory: sCategory));
        resultList.add(CategoryModel(
            id: 6,
            name: "Clothes",
            image: "assets/images/products/new_shirt.png",
            sCategory: sCategory));
        break;
      case SCategory.Kids:
        break;
      default:
    }
    return Future.value(resultList);
  }
}
