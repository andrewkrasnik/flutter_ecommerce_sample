import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';

class CatalogPage extends StatelessWidget {
  late final List<CatalogItem> catalog;

  CatalogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _grayColor = const Color(0xFF9B9B9B);
    catalog = (BlocProvider.of<ShopPageCubit>(context).state as ShopPageCatalog)
        .catalog;

    return CupertinoPageScaffold(
        navigationBar: shopAppBar(
          context: context,
          title: "Categories",
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                height: 48,
                width: double.maxFinite,
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(219, 48, 34, 1),
                  onPressed: () {},
                  child: const Text(
                    "VIEW ALL ITEMS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 20),
              child: Text(
                "Choose category",
                style: TextStyle(color: _grayColor, fontSize: 14),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      CatalogItem catalogItem = catalog[index];
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<ShopPageCubit>(context)
                              .toProductList(catalogItem);
                        },
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.only(left: 30, top: 15),
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            catalogItem.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 0.2,
                        width: double.maxFinite,
                        color: _grayColor,
                      );
                    },
                    itemCount: catalog.length))
          ],
        ));
  }
}
