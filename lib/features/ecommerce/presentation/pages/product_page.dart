import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/product/product_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/info_wiget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/recomended_products_list.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/select_color_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/select_size_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/favorite_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/price_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';

class ProductPage extends StatelessWidget {
  Product product;
  ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              product.shortName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: CupertinoButton(
                padding: const EdgeInsets.only(bottom: 3),
                child: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                onPressed: () {}),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 413,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: product.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Image(
                            image: AssetImage(product.images[index]),
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FieldWidget(
                        text: (state as ProductPageState).size == null
                            ? "Size"
                            : (state as ProductPageState).size!.name,
                        width: MediaQuery.of(context).size.width / 2.7,
                        onTap: () {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (context) => SelectSizeWidget(
                                product: product,
                                buttonTitle: "ADD TO CARD",
                                selectedSize: (state as ProductPageState).size,
                                selectSize:
                                    BlocProvider.of<ProductCubit>(context)
                                        .selectSize),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      FieldWidget(
                        text: (state as ProductPageState).color == null
                            ? "Color"
                            : (state as ProductPageState).color!.name,
                        width: MediaQuery.of(context).size.width / 2.7,
                        onTap: () {
                          showCupertinoModalPopup<void>(
                              context: context,
                              builder: (context) => SelectColorWidget(
                                    product: product,
                                  ));
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      FavoriteIconButton(
                          product: product,
                          onTap: () {
                            BlocProvider.of<ProductCubit>(context)
                                .addToFavorites(product);
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.brand.name,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(product.name,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.grayText,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          StarRatingWidget(product),
                        ],
                      ),
                      PriceTextWiget(
                        product: product,
                        fontSize: 24,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(product.description,
                      style: const TextStyle(fontSize: 14)),
                ),
                const SizedBox(
                  height: 16,
                ),
                const InfoWiget(text: "Item details"),
                const InfoWiget(text: "Shipping info"),
                const InfoWiget(text: "Support"),
                RecomendedProductsList(
                  productList: (state as ProductPageState).recomendedProducts,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          // Container(
          //   height: 112,
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          //   decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          //     BoxShadow(
          //         color: AppColors.shadow,
          //         spreadRadius: 0.2,
          //         blurRadius: 1,
          //         offset: const Offset(0, -1))
          //   ]),
          //   child: RedButton(
          //     text: "ADD TO CARD",
          //     height: 48,
          //   ),
          // ),
        );
      },
    );
  }
}
