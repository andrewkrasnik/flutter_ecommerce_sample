import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/products_repository.dart';

class GetRecomendedProducts {
  final ProductsRepository productsRepository;

  GetRecomendedProducts(this.productsRepository);

  Future<List<Product>> call() async {
    return await productsRepository.getRecomendedProducts();
  }
}
