part of 'favorites_page_cubit.dart';

@immutable
abstract class FavoritesPageState {}

class FavoritesListState extends FavoritesPageState {
  final List<Favorite> favoritesList;
  final bool itemView;
  final SortType? sortBy;
  final ProductFilter? filter;
  FavoritesListState({
    required this.favoritesList,
    this.itemView = true,
    this.sortBy,
    this.filter,
  });

  FavoritesListState copyWith({
    List<Favorite>? favoritesList,
    bool? itemView,
    SortType? sortBy,
    ProductFilter? filter,
  }) {
    return FavoritesListState(
      favoritesList: favoritesList ?? this.favoritesList,
      itemView: itemView ?? this.itemView,
      sortBy: sortBy ?? this.sortBy,
      filter: filter ?? this.filter,
    );
  }
}
