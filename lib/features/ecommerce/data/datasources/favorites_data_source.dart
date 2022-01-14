import 'package:flutter_ecommerce_sample/features/ecommerce/data/models/favorite_model.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/models/product_model.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/brand.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product_filter.dart';

abstract class FavoritesDataSource {
  Future<List<Favorite>> getFavorites(
      {ProductFilter? filter, SortType? sortType});
  Future<void> add(Favorite favorite);
  Future<void> delete(Favorite favorite);
}

class FavoritesDataSourceImpl implements FavoritesDataSource {
  List<Favorite> favorites = [];

  FavoritesDataSourceImpl() {
    favorites = testFavorites();
  }

  List<FavoriteModel> testFavorites() {
    Brand lime = Brand(id: 10, name: "LIME");
    Brand mango = Brand(id: 11, name: "Mango");
    Brand oliver = Brand(id: 12, name: "Oliwer");
    Brand berries = Brand(id: 13, name: "&Berries");

    List<ProductModel> productList = [];

    productList.add(ProductModel(
        id: 16,
        name: "Shirt",
        description: "Shirt",
        brand: lime,
        rating: 5,
        price: 32,
        salePrice: 0,
        sale: 0,
        reviewCount: 10,
        images: ["assets/images/products/shirt_favorites.png"],
        isFavorite: true));

    productList.add(ProductModel(
        id: 17,
        name: "Longsleeve Violeta",
        description: "Longsleeve Violeta",
        brand: mango,
        rating: 0,
        price: 46,
        salePrice: 0,
        sale: 0,
        reviewCount: 0,
        images: ["assets/images/products/longsleeve_favorites.png"],
        isFavorite: true,
        isNew: true));

    productList.add(ProductModel(
        id: 18,
        name: "Shirt",
        description: "Shirt",
        brand: oliver,
        rating: 4,
        price: 52,
        salePrice: 0,
        sale: 0,
        reviewCount: 3,
        images: ["assets/images/products/shirt_outofstock.png"],
        isFavorite: true,
        outOfStock: true));

    productList.add(ProductModel(
        id: 19,
        name: "T-Shirt",
        shortName: "T-Shirt",
        description: "T-Shirt",
        brand: berries,
        rating: 0,
        price: 55,
        salePrice: 39,
        sale: 30,
        reviewCount: 0,
        images: [
          "assets/images/products/tshirt_favorites.png",
        ],
        isFavorite: true));

    List<FavoriteModel> resultList = [
      FavoriteModel(productList[0], ProductSizes.l, ProductColors.blue),
      FavoriteModel(productList[1], ProductSizes.s, ProductColors.orange),
      FavoriteModel(productList[2], ProductSizes.l, ProductColors.gray),
      FavoriteModel(productList[3], ProductSizes.s, ProductColors.black),
    ];

    return resultList;
  }

  @override
  Future<void> add(Favorite favorite) async {
    // if (!favorites.contains(favorite)) {
    favorites
        .add(FavoriteModel(favorite.product, favorite.size, favorite.color));
    // }
    return Future.value();
  }

  @override
  Future<void> delete(Favorite favorite) async {
    //if (!favorites.contains(favorite)) {
    favorites.remove(favorite);
    //}
    return Future.value();
  }

  @override
  Future<List<Favorite>> getFavorites(
      {ProductFilter? filter, SortType? sortType}) async {
    if (sortType == SortTypes.customerReview) {
      favorites.sort(
          (a, b) => b.product.reviewCount.compareTo(a.product.reviewCount));
    } else if (sortType == SortTypes.priceHighest) {
      favorites.sort((a, b) {
        final double priseA =
            a.product.salePrice == 0 ? a.product.price : a.product.salePrice;
        final double priseB =
            b.product.salePrice == 0 ? b.product.price : b.product.salePrice;
        return priseB.compareTo(priseA);
      });
    } else if (sortType == SortTypes.priceLowest) {
      favorites.sort((a, b) {
        final double priseA =
            a.product.salePrice == 0 ? a.product.price : a.product.salePrice;
        final double priseB =
            b.product.salePrice == 0 ? b.product.price : b.product.salePrice;
        return priseA.compareTo(priseB);
      });
    } else if (sortType == SortTypes.popular) {
      favorites.sort((a, b) => b.product.rating.compareTo(a.product.rating));
    } else if (sortType == SortTypes.newest) {
      favorites.sort((a, b) {
        if (a.product.isNew & b.product.isNew) {
          return 0;
        } else if (a.product.isNew & !b.product.isNew) {
          return -1;
        }

        return 1;
      });
    }
    return Future.value(favorites);
  }
}
