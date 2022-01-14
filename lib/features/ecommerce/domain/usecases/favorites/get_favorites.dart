import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product_filter.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/favorites_repository.dart';

class GetFavorites {
  final FavoritesRepository favoritesRepository;

  GetFavorites(this.favoritesRepository);

  Future<List<Favorite>> call(
      {ProductFilter? filter, SortType? sortType}) async {
    return await favoritesRepository.getFavorites(
        filter: filter, sortType: sortType);
  }
}
