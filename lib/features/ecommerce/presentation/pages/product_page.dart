import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/product/product_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/info_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/recomended_products_list.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/select_color_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/select_size_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/favorite_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/price_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance.get<ProductCubit>(param1: product, param2: 0)
            ..loadRecomendedProducts(),
      child: NewWidget(product: product),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        (state as ProductPageState);
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                product.shortName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: CupertinoButton(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    const url =
                        "https://github.com/andrewkrasnik/flutter_ecommerce_sample";
                    if (await canLaunch(url)) {
                      launch(url, forceSafariVC: false);
                    }
                  }),
            ),
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
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
                            text: state.size == null
                                ? "Size"
                                : (state).size!.name,
                            width: MediaQuery.of(context).size.width / 2.7,
                            selected: state.size != null,
                            onTap: () {
                              showCupertinoModalPopup<void>(
                                context: context,
                                builder: (modalContext) => SelectSizeWidget(
                                    product: product,
                                    buttonTitle: "ADD TO CARD",
                                    selectedSize: (state).size,
                                    redButtonCallBack: (size) {
                                      BlocProvider.of<ProductCubit>(context)
                                          .addToBag(
                                              product: product,
                                              size: state.size!,
                                              color: state.color!);
                                      Navigator.of(context,
                                              rootNavigator: false)
                                          .pop();
                                    },
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
                            text: state.color == null
                                ? "Color"
                                : state.color!.name,
                            width: MediaQuery.of(context).size.width / 2.7,
                            selected: state.color != null,
                            onTap: () {
                              showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (modalContext) => SelectColorWidget(
                                        product: product,
                                        selectColor:
                                            BlocProvider.of<ProductCubit>(
                                                    context)
                                                .selectColor,
                                        redButtonCallBack: () {
                                          BlocProvider.of<ProductCubit>(context)
                                              .addToBag(
                                                  product: product,
                                                  size: state.size!,
                                                  color: state.color!);
                                          Navigator.of(context,
                                                  rootNavigator: false)
                                              .pop();
                                        },
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(product.description,
                          style: const TextStyle(fontSize: 14)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const InfoWidget(text: "Item details"),
                    const InfoWidget(text: "Shipping info"),
                    const InfoWidget(text: "Support"),
                    RecomendedProductsList(
                      productList: state.recomendedProducts,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                    BoxShadow(
                        color: AppColors.shadow,
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: const Offset(0, -1))
                  ]),
                  child: RedButton(
                    text: "ADD TO CARD",
                    onTap: () {
                      BlocProvider.of<ProductCubit>(context).addToBag(
                          product: product,
                          size: state.size!,
                          color: state.color!);
                      Navigator.of(context).pop();
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Container(
                      //         color: AppColors.shadow, child: Text("test"))));
                    },
                    height: 48,
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
