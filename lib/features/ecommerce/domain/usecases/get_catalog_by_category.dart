import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/catalog_repository.dart';

class GetCatalogByCategory {
  final CatalogRepository catalogRepository;

  GetCatalogByCategory(this.catalogRepository);

  Future<List<CatalogItem>> call(Category category) async {
    return await catalogRepository.getCatalogByCategory(category);
  }
}
