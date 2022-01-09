import 'package:flutter_ecommerce_sample/features/ecommerce/data/models/catalog_item_model.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';

abstract class CatalogDataSource {
  Future<List<CatalogItemModel>> getAllCatalog();
  Future<List<CatalogItemModel>> getCatalogByCategory(Category category);
}

class CatalogDataSourceImpl implements CatalogDataSource {
  @override
  Future<List<CatalogItemModel>> getAllCatalog() async {
    return Future.value([]);
  }

  @override
  Future<List<CatalogItemModel>> getCatalogByCategory(Category category) async {
    List<CatalogItemModel> resultList = [];
    if (category.name == "Clothes") {
      resultList.add(CatalogItemModel(
          id: 1, name: "Tops", fullName: "Women's tops", category: category));
      resultList.add(CatalogItemModel(
          id: 1,
          name: "Shirts & Blouses",
          fullName: "Women's shirts & blouses",
          category: category));
      resultList.add(CatalogItemModel(
          id: 1,
          name: "Cardigans & Sweaters",
          fullName: "Women's Cardigans & Sweaters",
          category: category));
      resultList.add(CatalogItemModel(
          id: 1,
          name: "Knitwear",
          fullName: "Women's Knitwear",
          category: category));
      resultList.add(CatalogItemModel(
          id: 1,
          name: "Outerwear",
          fullName: "Women's Outerwear",
          category: category));
      resultList.add(CatalogItemModel(
          id: 1, name: "Pants", fullName: "Women's Pants", category: category));
      resultList.add(CatalogItemModel(
          id: 1, name: "Jeans", fullName: "Women's Jeans", category: category));
      resultList.add(CatalogItemModel(
          id: 1,
          name: "Shorts",
          fullName: "Women's Shorts",
          category: category));
      resultList.add(CatalogItemModel(
          id: 1,
          name: "Dresses",
          fullName: "Women's Dresses",
          category: category));
    }
    return Future.value(resultList);
  }
}
