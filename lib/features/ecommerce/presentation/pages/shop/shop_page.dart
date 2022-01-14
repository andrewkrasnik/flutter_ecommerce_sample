import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/catalog_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/categories_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/product_list_page.dart';

class ShopPage extends StatelessWidget {
  bool? _showNew;
  bool? _showSale;
  ShopPage.newProducts() {
    _showNew = true;
  }
  ShopPage.saleProducts() {
    _showSale = true;
  }
  ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopPageCubit, ShopPageState>(
      builder: (context, state) {
        Widget newPage = Container();
        if (state is ShopPageCategories) {
          newPage = CategoriesPage();
        } else if (state is ShopPageCatalog) {
          newPage = CatalogPage();
        } else if (state is ShopPageProductList) {
          newPage = ProductListPage();
        } else if (state is ShopPageNewProductList) {
          newPage = ProductListPage();
        } else if (state is ShopPageSaleProductList) {
          newPage = ProductListPage();
        }
        return newPage;
      },
    );
  }
}
