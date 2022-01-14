import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/favorites_repository.dart';

class AddFavorite {
  final FavoritesRepository favoritesRepository;

  AddFavorite(this.favoritesRepository);

  Future<void> call(Favorite favorite) async {
    return await favoritesRepository.add(favorite);
  }
}
