import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getSaleProducts();
  Future<List<Product>> getNewProducts();
  Future<List<Product>> getProductsByCatalogItem(CatalogItem catalogItem);
}
