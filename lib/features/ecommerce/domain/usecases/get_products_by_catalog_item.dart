import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/products_repository.dart';

class GetProductsByCatalogItem {
  final ProductsRepository productsRepository;

  GetProductsByCatalogItem(this.productsRepository);

  Future<List<Product>> call(CatalogItem catalogItem) async {
    return await productsRepository.getProductsByCatalogItem(catalogItem);
  }
}
