import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_catalog_by_category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_categories_by_scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_products_by_catalog_Item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/product_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/filters_page.dart';
import 'package:meta/meta.dart';

part 'shop_page_state.dart';

class ShopPageCubit extends Cubit<ShopPageState> {
  final GetCategoriesBySCategory getCategoriesBySCategory;
  final GetCatalogByCategory getCatalogByCategory;
  final GetProductsByCatalogItem getProductsByCatalogItem;
  final AddFavorite addFavorite;

  ShopPageCubit(
      {required this.getCategoriesBySCategory,
      required this.getCatalogByCategory,
      required this.getProductsByCatalogItem,
      required this.addFavorite})
      : super(
            ShopPageCategories(sCategory: SCategory.Woman, categoriesList: []));

  void selectSCategory(SCategory sCategory) async {
    emit(ShopPageCategories(sCategory: sCategory, categoriesList: []));
    await Future.delayed(const Duration(milliseconds: 500));
    List<Category> categoriesList = await getCategoriesBySCategory(sCategory);
    emit(ShopPageCategories(
        sCategory: sCategory, categoriesList: categoriesList));
  }

  void toCatalog(Category category) async {
    emit(ShopPageCatalog(catalog: [], category: category));
    await Future.delayed(const Duration(milliseconds: 500));
    List<CatalogItem> catalog = await getCatalogByCategory(category);
    emit(ShopPageCatalog(catalog: catalog, category: category));
  }

  void toProductList(CatalogItem catalogItem) async {
    emit(ShopPageProductList(productList: [], catalogItem: catalogItem));
    await Future.delayed(const Duration(milliseconds: 500));
    List<Product> productList = await getProductsByCatalogItem(catalogItem);
    emit(ShopPageProductList(
        productList: productList, catalogItem: catalogItem));
  }

  void goBack(BuildContext context) {
    if (state is ShopPageCatalog) {
      selectSCategory((state as ShopPageCatalog).category.sCategory);
    } else if (state is ShopPageProductList) {
      toCatalog((state as ShopPageProductList).catalogItem.category);
    } else if (state is ShopPageFilters) {
      toProductList((state as ShopPageFilters).catalogItem);
    } else {
      // Navigator.of(context).pop();
    }
  }

  void changeItemView() async {
    if (state is ShopPageProductList) {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ShopPageProductList(
          productList: (state as ShopPageProductList).productList,
          catalogItem: (state as ShopPageProductList).catalogItem,
          itemView: !(state as ShopPageProductList).itemView,
          sortBy: (state as ShopPageProductList).sortBy));
    }
  }

  void toFilters(BuildContext context) async {
    //Navigator.of(context).pushNamed("/shop/filters");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FiltersPage()));
  }

  void changeSortType(BuildContext context, SortType sortBy) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(ShopPageProductList(
        productList: (state as ShopPageProductList).productList,
        catalogItem: (state as ShopPageProductList).catalogItem,
        itemView: (state as ShopPageProductList).itemView,
        sortBy: sortBy));
  }

  void toProductPage(BuildContext context, Product product) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProductPage(product: product)));
  }

  void addToFavorites(
      {required Product product, required ProductSize size}) async {
    if (!product.isFavorite) {
      await addFavorite(
          Favorite(product: product, size: size, color: product.colors[0]));
      product.isFavorite = true;
      emit(state);
    }
  }
}
