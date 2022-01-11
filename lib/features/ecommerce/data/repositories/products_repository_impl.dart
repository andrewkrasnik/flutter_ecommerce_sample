import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/products_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource productsDataSource;

  ProductsRepositoryImpl(this.productsDataSource);

  @override
  Future<List<Product>> getAllProducts() async {
    return await productsDataSource.getAllProducts();
  }

  @override
  Future<List<Product>> getProductsByCatalogItem(
      CatalogItem catalogItem) async {
    return await productsDataSource.getCategoryByCatalogItem(catalogItem);
  }

  @override
  Future<List<Product>> getNewProducts() async {
    return await productsDataSource.getNewProducts();
  }

  @override
  Future<List<Product>> getSaleProducts() async {
    return await productsDataSource.getSaleProducts();
  }
}
