import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product_filter.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/delete_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/get_favorites.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/product_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/filters_page.dart';
import 'package:meta/meta.dart';

part 'favorites_page_state.dart';

class FavoritesPageCubit extends Cubit<FavoritesPageState> {
  final GetFavorites getFavorites;
  final DeleteFavorite deleteFavorite;

  FavoritesPageCubit({
    required this.getFavorites,
    required this.deleteFavorite,
  }) : super(FavoritesListState(favoritesList: []));

  void loadList({SortType? sortBy, ProductFilter? filter}) async {
    emit(FavoritesListState(favoritesList: []));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(FavoritesListState(
        favoritesList: await getFavorites(sortType: sortBy, filter: filter)));
  }

  void changeItemView() async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit((state as FavoritesListState)
        .copyWith(itemView: !(state as FavoritesListState).itemView));
  }

  void toFilters(BuildContext context) async {
    //Navigator.of(context).pushNamed("/shop/filters");
    ProductFilter filter = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FiltersPage()));
    emit((state as FavoritesListState).copyWith(filter: filter));
  }

  void changeSortType(BuildContext context, SortType sortBy) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit((state as FavoritesListState).copyWith(
        sortBy: sortBy, favoritesList: await getFavorites(sortType: sortBy)));
  }

  void toProductPage(BuildContext context, Product product) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProductPage(product: product)));
  }

  void delete(Favorite favorite) async {
    await deleteFavorite(favorite);
    await Future.delayed(const Duration(milliseconds: 500));
    emit((state as FavoritesListState)
        .copyWith(favoritesList: await getFavorites()));
  }
}
