import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/circle_bordered_image.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/product_label_widget.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/select_size_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/favorite_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/price_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/sort_type_list_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';

class ProductListPage extends StatelessWidget {
  late final List<Product> productList;

  late SortType sortBy;
  late bool itemView;

  ProductListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "";
    ShopPageState state = BlocProvider.of<ShopPageCubit>(context).state;
    if (state is ShopPageProductList) {
      productList = state.productList;
      itemView = state.itemView;
      sortBy = state.sortBy ?? SortTypes.priceLowest;
      title = state.catalogItem.fullName;
    } else if (state is ShopPageNewProductList) {
      productList = state.productList;
      itemView = state.itemView;
      sortBy = state.sortBy ?? SortTypes.priceLowest;
      title = "New";
    } else if (state is ShopPageSaleProductList) {
      productList = state.productList;
      itemView = state.itemView;
      sortBy = state.sortBy ?? SortTypes.priceLowest;
      title = "Sale";
    } else if (state is ShopPageViewAllProducts) {
      productList = state.productList;
      itemView = state.itemView;
      sortBy = state.sortBy ?? SortTypes.priceLowest;
      title = "All catalog";
    } else {
      return Container();
    }

    return CupertinoPageScaffold(
        navigationBar: shopAppBar(context: context, noBorder: true),
        child: Column(
          children: [
            Material(
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                width: double.maxFinite,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 76,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   children: [
                      //     Container(
                      //       color: Colors.black,
                      //       child: Text(
                      //         "T-shirt",
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        margin: const EdgeInsets.only(top: 18, bottom: 10),
                        height: 24,
                        color: AppColors.mainColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<ShopPageCubit>(context)
                                    .toFilters(context);
                              },
                              child: Row(
                                children: const [
                                  ImageIcon(
                                    AssetImage("assets/icons/filter.png"),
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Filters",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // BlocProvider.of<ShopPageCubit>(context)
                                //     .selectSortType(context);
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (context) => SortTypeListWiget(
                                    selectedSortType: sortBy,
                                    changeSortType:
                                        BlocProvider.of<ShopPageCubit>(context)
                                            .changeSortType,
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 140,
                                child: Row(
                                  children: [
                                    const ImageIcon(
                                      AssetImage("assets/icons/sort.png"),
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      sortBy.name,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<ShopPageCubit>(context)
                                    .changeItemView();
                              },
                              child: itemView
                                  ? const ImageIcon(
                                      AssetImage("assets/icons/tiles.png"),
                                      color: Colors.black,
                                    )
                                  : const ImageIcon(
                                      AssetImage("assets/icons/items.png"),
                                      color: Colors.black,
                                    ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            itemView
                ? Expanded(
                    child: ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = productList[index];
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<ShopPageCubit>(context)
                                  .toProductPage(context, product);
                            },
                            child: Stack(
                              children: [
                                Column(children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16, top: 16),
                                    height: 104,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleBorderedImage(
                                            height: 104,
                                            width: 100,
                                            image: product.images[0],
                                            topLeft: const Radius.circular(10),
                                            bottomLeft:
                                                const Radius.circular(10)),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, top: 10),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.name,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    product.brand.name,
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      color: AppColors.grayText,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  StarRatingWidget(product),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  PriceTextWiget(
                                                      product: product),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ]),
                                Positioned(
                                  top: 20,
                                  left: 20,
                                  child: ProductLabelWidget(product: product),
                                ),
                                Positioned(
                                    right: 18,
                                    bottom: 0,
                                    child: FavoriteIconButton(
                                      product: product,
                                      onTap: () {
                                        favoriteButtonOnTap(context, product);
                                      },
                                    ))
                              ],
                            ),
                          );
                        }))
                : Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisExtent: 277),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = productList[index];
                          return GestureDetector(
                              onTap: () {
                                BlocProvider.of<ShopPageCubit>(context)
                                    .toProductPage(context, product);
                              },
                              child: Stack(children: [
                                Container(
                                  height: 261,
                                  width: 164,
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleBorderedImage(
                                          height: 184,
                                          width: 162,
                                          image: product.images[0],
                                          topLeft: const Radius.circular(10),
                                          bottomLeft: const Radius.circular(10),
                                          topRight: const Radius.circular(10),
                                          bottomRight:
                                              const Radius.circular(10)),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      StarRatingWidget(product),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        product.brand.name,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: AppColors.grayText),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      PriceTextWiget(product: product),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 28,
                                  left: 30,
                                  child: ProductLabelWidget(product: product),
                                ),
                                Positioned(
                                    left: 142,
                                    top: 178,
                                    child: FavoriteIconButton(
                                      product: product,
                                      onTap: () {
                                        favoriteButtonOnTap(context, product);
                                      },
                                    ))
                              ]));
                        }),
                  )
          ],
        ));
  }

  void favoriteButtonOnTap(BuildContext context, Product product) {
    if (!product.isFavorite) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => SelectSizeWidget(
          product: product,
          buttonTitle: "ADD TO FAVORITES",
          redButtonCallBack: (ProductSize size) {
            BlocProvider.of<ShopPageCubit>(context)
                .addToFavorites(product: product, size: size);
          },
        ),
      );
    }
  }
}
