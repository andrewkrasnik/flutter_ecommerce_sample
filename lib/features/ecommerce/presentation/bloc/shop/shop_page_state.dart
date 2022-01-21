part of 'shop_page_cubit.dart';

@immutable
abstract class ShopPageState extends Equatable {}

class ShopPageCategories extends ShopPageState {
  final SCategory sCategory;
  final List<Category> categoriesList;
  ShopPageCategories({
    required this.sCategory,
    required this.categoriesList,
  });
  @override
  List<Object?> get props => [sCategory, categoriesList];
}

class ShopPageCatalog extends ShopPageState {
  final List<CatalogItem> catalog;
  final Category category;
  ShopPageCatalog({
    required this.catalog,
    required this.category,
  });

  @override
  List<Object?> get props => [catalog, category];
}

class ShopPageProductList extends ShopPageState {
  final List<Product> productList;
  final CatalogItem catalogItem;
  final bool itemView;
  final SortType? sortBy;
  ShopPageProductList({
    required this.productList,
    required this.catalogItem,
    this.itemView = true,
    this.sortBy,
  });

  @override
  List<Object?> get props => [productList, catalogItem, itemView, sortBy];
}

class ShopPageNewProductList extends ShopPageState {
  final List<Product> productList;
  final bool itemView;
  final SortType? sortBy;

  ShopPageNewProductList(
      {required this.productList, this.itemView = true, this.sortBy});

  @override
  List<Object?> get props => [productList, itemView, sortBy];
}

class ShopPageSaleProductList extends ShopPageState {
  final List<Product> productList;
  final bool itemView;
  final SortType? sortBy;

  ShopPageSaleProductList(
      {required this.productList, this.itemView = true, this.sortBy});

  @override
  List<Object?> get props => [productList, itemView, sortBy];
}

class ShopPageViewAllProducts extends ShopPageState {
  final List<Product> productList;
  final bool itemView;
  final SortType? sortBy;

  ShopPageViewAllProducts(
      {required this.productList, this.itemView = true, this.sortBy});

  @override
  List<Object?> get props => [productList, itemView, sortBy];
}
