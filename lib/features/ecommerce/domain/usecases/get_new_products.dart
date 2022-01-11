import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/products_repository.dart';

class GetNewProducts {
  final ProductsRepository productsRepository;

  GetNewProducts(this.productsRepository);

  Future<List<Product>> call() async {
    return await productsRepository.getNewProducts();
  }
}
