import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/catalog_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/categories_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/product_list_page.dart';

class ShopPage extends StatelessWidget {
  ShopPage.newProducts(BuildContext context, {Key? key}) : super(key: key) {
    BlocProvider.of<ShopPageCubit>(context).showNewProducts();
  }
  ShopPage.saleProducts(BuildContext context, {Key? key}) : super(key: key) {
    BlocProvider.of<ShopPageCubit>(context).showSaleProducts();
  }

  const ShopPage({
    Key? key,
    required BuildContext context,
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
        } else if (state is ShopPageViewAllProducts) {
          newPage = ProductListPage();
        }
        return newPage;
      },
    );
  }
}
