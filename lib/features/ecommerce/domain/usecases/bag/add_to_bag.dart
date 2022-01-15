import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class AddToBag {
  final BagRepository repository;

  AddToBag(this.repository);

  Future<void> call(
      {required Product product,
      required ProductSize size,
      required ProductColor color}) async {
    return await repository.addToBag(
        product: product, size: size, color: color);
  }
}
