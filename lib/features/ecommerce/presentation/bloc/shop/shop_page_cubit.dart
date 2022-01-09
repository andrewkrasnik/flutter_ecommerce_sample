import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_catalog_by_category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_categories_by_scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_products_by_catalog_Item.dart';
import 'package:meta/meta.dart';

part 'shop_page_state.dart';

class ShopPageCubit extends Cubit<ShopPageState> {
  final GetCategoriesBySCategory getCategoriesBySCategory;
  final GetCatalogByCategory getCatalogByCategory;
  final GetProductsByCatalogItem getProductsByCatalogItem;

  ShopPageCubit({
    required this.getCategoriesBySCategory,
    required this.getCatalogByCategory,
    required this.getProductsByCatalogItem,
  }) : super(
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
    } else {
      // Navigator.of(context).pop();
    }
  }
}
