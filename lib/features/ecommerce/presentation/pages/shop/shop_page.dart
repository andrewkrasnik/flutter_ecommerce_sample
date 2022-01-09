import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/catalog_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/categories_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/product_list_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopPageCubit, ShopPageState>(
      builder: (context, state) {
        if (state is ShopPageCategories) {
          return CategoriesPage(
            sCategory: state.sCategory,
            categoriesList: state.categoriesList,
          );
        } else if (state is ShopPageCatalog) {
          return CatalogPage(catalog: state.catalog);
        } else if (state is ShopPageProductList) {
          return ProductListPage(
            productList: state.productList,
            catalogItem: state.catalogItem,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
