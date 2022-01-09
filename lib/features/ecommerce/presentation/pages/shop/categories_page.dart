import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  final SCategory sCategory;
  final List<Category> categoriesList;
  CategoriesPage({
    required this.sCategory,
    required this.categoriesList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: shopAppBar(
        context: context,
        title: "Categories",
      ),
      child: Column(children: [
        Row(children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<ShopPageCubit>(context)
                  .selectSCategory(SCategory.Woman);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: (sCategory == SCategory.Woman)
                      ? const Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(219, 48, 34, 1), width: 3),
                        )
                      : null,
                ),
                width: MediaQuery.of(context).size.width / 3,
                height: 44,
                child: const Center(
                    child: Text(
                  "Women",
                  style: TextStyle(fontSize: 16),
                ))),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<ShopPageCubit>(context)
                  .selectSCategory(SCategory.Men);
            },
            child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: (sCategory == SCategory.Men)
                      ? const Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(219, 48, 34, 1), width: 3),
                        )
                      : null,
                ),
                child: const Center(
                    child: Text(
                  "Men",
                  style: TextStyle(fontSize: 16),
                ))),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<ShopPageCubit>(context)
                  .selectSCategory(SCategory.Kids);
            },
            child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: (sCategory == SCategory.Kids)
                      ? const Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(219, 48, 34, 1), width: 3),
                        )
                      : null,
                ),
                child: const Center(
                    child: Text(
                  "Kids",
                  style: TextStyle(fontSize: 16),
                ))),
          ),
        ]),
        Container(
          height: 100,
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(219, 48, 34, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "SUMMER SALES",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Up to 50% off",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        ),
        categoriesList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: categoriesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Category category = categoriesList[index];
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<ShopPageCubit>(context)
                              .toCatalog(category);
                        },
                        child: Container(
                          height: 100,
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 8),
                          padding: const EdgeInsets.only(left: 23),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                category.image,
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ]),
    );
  }
}
