import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class Favorite {
  final Product product;
  final ProductSize size;
  final ProductColor color;

  Favorite({
    required this.product,
    required this.size,
    required this.color,
  });
}
