import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/catalog_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogDataSource catalogDataSource;

  CatalogRepositoryImpl(this.catalogDataSource);

  @override
  Future<List<CatalogItem>> getAllCatalog() async {
    return await catalogDataSource.getAllCatalog();
  }

  @override
  Future<List<CatalogItem>> getCatalogByCategory(Category category) async {
    return await catalogDataSource.getCatalogByCategory(category);
  }
}
