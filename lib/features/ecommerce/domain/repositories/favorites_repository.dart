import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product_filter.dart';

abstract class FavoritesRepository {
  Future<List<Favorite>> getFavorites(
      {ProductFilter? filter, SortType? sortType});
  Future<void> add(Favorite favorite);
  Future<void> delete(Favorite favorite);
}
