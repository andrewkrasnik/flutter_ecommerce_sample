import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/favorites_data_source.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product_filter.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource favoritesDataSource;

  FavoritesRepositoryImpl(this.favoritesDataSource);

  @override
  Future<void> add(Favorite favorite) async {
    return await favoritesDataSource.add(favorite);
  }

  @override
  Future<void> delete(Favorite favorite) async {
    return await favoritesDataSource.delete(favorite);
  }

  @override
  Future<List<Favorite>> getFavorites(
      {ProductFilter? filter, SortType? sortType}) async {
    return await favoritesDataSource.getFavorites(
        filter: filter, sortType: sortType);
  }
}
