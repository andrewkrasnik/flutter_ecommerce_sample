import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class FavoriteModel extends Favorite {
  FavoriteModel(
    Product product,
    ProductSize size,
    ProductColor color,
  ) : super(product: product, size: size, color: color);
}
