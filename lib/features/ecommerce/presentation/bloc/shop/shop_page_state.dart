part of 'shop_page_cubit.dart';

@immutable
abstract class ShopPageState extends Equatable {
  ShopPageState copyWith();
}

class ShopPageCategories extends ShopPageState {
  final SCategory sCategory;
  final List<Category> categoriesList;
  ShopPageCategories({
    required this.sCategory,
    required this.categoriesList,
  });
  @override
  List<Object?> get props => [sCategory, categoriesList];

  @override
  ShopPageCategories copyWith({
    SCategory? sCategory,
    List<Category>? categoriesList,
  }) {
    return ShopPageCategories(
      sCategory: sCategory ?? this.sCategory,
      categoriesList: categoriesList ?? this.categoriesList,
    );
  }
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

  @override
  ShopPageCatalog copyWith({
    List<CatalogItem>? catalog,
    Category? category,
  }) {
    return ShopPageCatalog(
      catalog: catalog ?? this.catalog,
      category: category ?? this.category,
    );
  }
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

  @override
  ShopPageProductList copyWith({
    List<Product>? productList,
    CatalogItem? catalogItem,
    bool? itemView,
    SortType? sortBy,
  }) {
    return ShopPageProductList(
      productList: productList ?? this.productList,
      catalogItem: catalogItem ?? this.catalogItem,
      itemView: itemView ?? this.itemView,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class ShopPageNewProductList extends ShopPageState {
  final List<Product> productList;
  final bool itemView;
  final SortType? sortBy;

  ShopPageNewProductList(
      {required this.productList, this.itemView = true, this.sortBy});

  @override
  List<Object?> get props => [productList, itemView, sortBy];

  @override
  ShopPageNewProductList copyWith({
    List<Product>? productList,
    bool? itemView,
    SortType? sortBy,
  }) {
    return ShopPageNewProductList(
      productList: productList ?? this.productList,
      itemView: itemView ?? this.itemView,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class ShopPageSaleProductList extends ShopPageState {
  final List<Product> productList;
  final bool itemView;
  final SortType? sortBy;

  ShopPageSaleProductList(
      {required this.productList, this.itemView = true, this.sortBy});

  @override
  List<Object?> get props => [productList, itemView, sortBy];

  @override
  ShopPageSaleProductList copyWith({
    List<Product>? productList,
    bool? itemView,
    SortType? sortBy,
  }) {
    return ShopPageSaleProductList(
      productList: productList ?? this.productList,
      itemView: itemView ?? this.itemView,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class ShopPageViewAllProducts extends ShopPageState {
  final List<Product> productList;
  final bool itemView;
  final SortType? sortBy;

  ShopPageViewAllProducts(
      {required this.productList, this.itemView = true, this.sortBy});

  @override
  List<Object?> get props => [productList, itemView, sortBy];

  @override
  ShopPageViewAllProducts copyWith({
    List<Product>? productList,
    bool? itemView,
    SortType? sortBy,
  }) {
    return ShopPageViewAllProducts(
      productList: productList ?? this.productList,
      itemView: itemView ?? this.itemView,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
