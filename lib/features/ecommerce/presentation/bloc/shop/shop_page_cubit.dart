import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_catalog_by_category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_categories_by_scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_new_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_products_by_catalog_Item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_sale_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/product_page.dart';
import 'package:meta/meta.dart';

part 'shop_page_state.dart';

class ShopPageCubit extends Cubit<ShopPageState> {
  final GetCategoriesBySCategory getCategoriesBySCategory;
  final GetCatalogByCategory getCatalogByCategory;
  final GetProductsByCatalogItem getProductsByCatalogItem;
  final AddFavorite addFavorite;
  final GetNewProducts getNewProducts;
  final GetSaleProducts getSaleProducts;

  ShopPageCubit({
    required this.getCategoriesBySCategory,
    required this.getCatalogByCategory,
    required this.getProductsByCatalogItem,
    required this.addFavorite,
    required this.getNewProducts,
    required this.getSaleProducts,
  }) : super(
            ShopPageCategories(sCategory: SCategory.Woman, categoriesList: []));

  void init() {
    selectSCategory(SCategory.Woman);
  }

  void selectSCategory(SCategory sCategory) async {
    emit(ShopPageCategories(sCategory: sCategory, categoriesList: []));
    await Future.delayed(const Duration(milliseconds: 500));
    List<Category> categoriesList = await getCategoriesBySCategory(sCategory);
    emit(ShopPageCategories(
        sCategory: sCategory, categoriesList: categoriesList));
  }

  void toCatalog(Category category) async {
    emit(ShopPageCatalog(catalog: const [], category: category));
    await Future.delayed(const Duration(milliseconds: 500));
    List<CatalogItem> catalog = await getCatalogByCategory(category);
    emit(ShopPageCatalog(catalog: catalog, category: category));
  }

  void toProductList(CatalogItem catalogItem) async {
    emit(ShopPageProductList(productList: const [], catalogItem: catalogItem));
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
    } else if (state is ShopPageSaleProductList) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        selectSCategory(SCategory.Woman);
      }
    } else {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        selectSCategory(SCategory.Woman);
      }
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
    Navigator.of(context, rootNavigator: true).pushNamed("/filters");
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
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => ProductPage(product: product)));
  }

  void addToFavorites(
      {required Product product, required ProductSize size}) async {
    await addFavorite(product: product, size: size, color: product.colors[0]);

    emit(state.copyWith());
  }

  void showNewProducts() async {
    emit(ShopPageNewProductList(
      productList: const [],
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      ShopPageNewProductList(
        productList: await getNewProducts(),
      ),
    );
  }

  void showSaleProducts() async {
    emit(ShopPageSaleProductList(
      productList: const [],
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      ShopPageSaleProductList(
        productList: await getSaleProducts(),
      ),
    );
  }

  viewAllItems() async {
    emit(ShopPageViewAllProducts(productList: const []));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(ShopPageViewAllProducts(productList: const []));
  }
}
