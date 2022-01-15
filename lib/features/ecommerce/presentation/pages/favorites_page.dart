import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/favorites/favorites_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bag_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/caption_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/circle_bordered_image.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/product_label_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/favorite_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/price_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/sale_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/sort_type_list_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesPageCubit, FavoritesPageState>(
      builder: (context, state) {
        List<Favorite> favoritesList =
            (state as FavoritesListState).favoritesList;

        SortType sortBy = state.sortBy ?? SortTypes.priceLowest;

        bool itemView = state.itemView;

        List<String> tags = ["Summer", "T-shirts", "Shirts", "Dresses"];

        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              border: null,
              trailing: SearchBarButton(),
            ),
            // : CupertinoNavigationBar(
            //     border: null,
            //     backgroundColor: AppColors.mainColor,
            //     middle: const Text(
            //       "Favorites",
            //       style:
            //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //     trailing: const SearchBarButton(),
            //   ),
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
                            height: 64,
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              "Favorites",
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 12, bottom: 4),
                              height: 30,
                              width: double.maxFinite,
                              child: ListView.builder(
                                  itemCount: tags.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 100,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 16),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black,
                                      ),
                                      child: Text(
                                        tags[index],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                                  })),
                          Container(
                            margin: const EdgeInsets.only(top: 18, bottom: 10),
                            height: 24,
                            color: const Color(0xFFF9F9F9),
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
                                            BlocProvider.of<FavoritesPageCubit>(
                                                    context)
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
                                    BlocProvider.of<FavoritesPageCubit>(context)
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
                            itemCount: favoritesList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Product product = favoritesList[index].product;
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<FavoritesPageCubit>(context)
                                      .toProductPage(context, product);
                                },
                                child: Stack(
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CircleBorderedImage(
                                                    height: 104,
                                                    width: 100,
                                                    image: product.images[0],
                                                    topLeft:
                                                        const Radius.circular(
                                                            10),
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            10)),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12, top: 10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            product.brand.name,
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: AppColors
                                                                    .grayText),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            product.name,
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: 80,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CaptionFieldWidget(
                                                                        caption:
                                                                            "Color",
                                                                        text: favoritesList[index]
                                                                            .color
                                                                            .name),
                                                                    const SizedBox(
                                                                      height:
                                                                          12,
                                                                    ),
                                                                    PriceTextWiget(
                                                                      product:
                                                                          product,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  CaptionFieldWidget(
                                                                      caption:
                                                                          "Size",
                                                                      text: favoritesList[
                                                                              index]
                                                                          .size
                                                                          .name),
                                                                  const SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  StarRatingWidget(
                                                                      product),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          product.outOfStock
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4, left: 16),
                                                  child: Text(
                                                    "Sorry, this item is currently sold out",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grayText,
                                                        fontSize: 11),
                                                  ))
                                              : Container(),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ]),
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      child: ProductLabelWidget(
                                        product: product,
                                      ),
                                    ),
                                    product.outOfStock
                                        ? Container()
                                        : Positioned(
                                            right: 18,
                                            bottom: 0,
                                            child: BagIconButton(
                                                onTap: () {
                                                  BlocProvider.of<
                                                              FavoritesPageCubit>(
                                                          context)
                                                      .addToCard(
                                                          favoritesList[index]);
                                                },
                                                product: product)),
                                    product.outOfStock
                                        ? Container(
                                            margin: const EdgeInsets.only(
                                                left: 16, right: 16, top: 16),
                                            height: 104,
                                            width: double.maxFinite,
                                            color: AppColors.white
                                                .withOpacity(0.5),
                                          )
                                        : Container(),
                                    Positioned(
                                        right: 10,
                                        top: 10,
                                        child: CupertinoButton(
                                          child: Icon(
                                            Icons.close,
                                            size: 20,
                                            color: AppColors.shadow
                                                .withOpacity(0.7),
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<FavoritesPageCubit>(
                                                    context)
                                                .delete(favoritesList[index]);
                                          },
                                        )),
                                  ],
                                ),
                              );
                            }))
                    : Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 294),
                            itemCount: favoritesList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Product product = favoritesList[index].product;
                              return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<FavoritesPageCubit>(context)
                                        .toProductPage(context, product);
                                  },
                                  child: Stack(children: [
                                    Container(
                                      height: 281,
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
                                              topLeft:
                                                  const Radius.circular(10),
                                              bottomLeft:
                                                  const Radius.circular(10),
                                              topRight:
                                                  const Radius.circular(10),
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
                                                color: Color(0xFF9B9B9B)),
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
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 78,
                                                child: CaptionFieldWidget(
                                                    caption: "Color",
                                                    text: favoritesList[index]
                                                        .color
                                                        .name),
                                              ),
                                              CaptionFieldWidget(
                                                  caption: "Size",
                                                  text: favoritesList[index]
                                                      .size
                                                      .name)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          PriceTextWiget(product: product),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 22,
                                        left: 24,
                                        child: ProductLabelWidget(
                                          product: product,
                                        )),
                                    product.outOfStock
                                        ? Container()
                                        : Positioned(
                                            right: 25,
                                            top: 178,
                                            child: BagIconButton(
                                                product: product)),
                                    product.outOfStock
                                        ? Container(
                                            height: 281,
                                            width: 162,
                                            margin: const EdgeInsets.only(
                                                left: 16, right: 16, top: 16),
                                            color: AppColors.white
                                                .withOpacity(0.5),
                                          )
                                        : Container(),
                                    Positioned(
                                        right: 15,
                                        top: 5,
                                        child: CupertinoButton(
                                          child: Icon(
                                            Icons.close,
                                            size: 20,
                                            color: AppColors.shadow,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<FavoritesPageCubit>(
                                                    context)
                                                .delete(favoritesList[index]);
                                          },
                                        )),
                                    product.outOfStock
                                        ? Positioned(
                                            top: 170,
                                            left: 16,
                                            child: Container(
                                                width: 162,
                                                height: 30,
                                                color: AppColors.white
                                                    .withOpacity(0.8),
                                                padding: const EdgeInsets.only(
                                                    top: 4, left: 8),
                                                child: Text(
                                                  "Sorry, this item is currently sold out",
                                                  style: TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 11),
                                                )),
                                          )
                                        : Container(),
                                  ]));
                            }),
                      ),
              ],
            ));
      },
    );
  }
}
