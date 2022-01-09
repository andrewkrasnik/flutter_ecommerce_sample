import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';

abstract class CatalogRepository {
  Future<List<CatalogItem>> getAllCatalog();
  Future<List<CatalogItem>> getCatalogByCategory(Category category);
}
