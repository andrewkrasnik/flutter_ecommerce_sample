part of 'shop_page_cubit.dart';

@immutable
abstract class ShopPageState {}

class ShopPageCategories extends ShopPageState {
  SCategory sCategory;
  List<Category> categoriesList;
  ShopPageCategories({
    required this.sCategory,
    required this.categoriesList,
  });
}

class ShopPageCatalog extends ShopPageState {
  final List<CatalogItem> catalog;
  final Category category;
  ShopPageCatalog({
    required this.catalog,
    required this.category,
  });
}

class ShopPageProductList extends ShopPageState {
  final List<Product> productList;
  final CatalogItem catalogItem;
  final bool itemView;
  final String sortBy;
  ShopPageProductList({
    required this.productList,
    required this.catalogItem,
    this.itemView = true,
    this.sortBy = "",
  });
}
