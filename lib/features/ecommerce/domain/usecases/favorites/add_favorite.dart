import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/favorites_repository.dart';

class AddFavorite {
  final FavoritesRepository favoritesRepository;

  AddFavorite(this.favoritesRepository);

  Future<void> call(
      {required Product product,
      required ProductSize size,
      required ProductColor color}) async {
    if (!product.isFavorite) {
      product.isFavorite = true;
      return await favoritesRepository
          .add(Favorite(product: product, size: size, color: color));
    }
  }
}
