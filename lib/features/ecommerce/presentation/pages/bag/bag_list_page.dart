import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/core/utils/formating.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/product_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bag/bag_change_count_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bag/select_promocode_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bag/sum_row_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bordered_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/caption_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/circle_bordered_image.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/promocode_search_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';

import 'checkout_page.dart';

class BagListPage extends StatelessWidget {
  const BagListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final state = context.watch<BagBloc>().state;
    final state = BlocProvider.of<BagBloc>(context).state as BagPageState;
    // if (state is! BagPageState) {
    //   return Container();
    // }
    Bag bag = (state).bag;

    List<Widget> itemsList = List.generate(bag.itemCount, (int index) {
      BagItem item = bag.getItem(index);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          margin: const EdgeInsets.only(top: 16, right: 2),
          height: 104,
          width: double.maxFinite,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: AppColors.shadow.withOpacity(0.3),
              spreadRadius: 0.2,
              offset: const Offset(2, -1),
            )
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute(
                          builder: (context) =>
                              ProductPage(product: item.product)));
                },
                child: CircleBorderedImage(
                    height: 104,
                    width: 100,
                    image: item.product.images[0],
                    topLeft: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: CaptionFieldWidget(
                                            caption: "Color:",
                                            text: item.color.name),
                                      ),
                                      CaptionFieldWidget(
                                          caption: "Size:",
                                          text: item.size.name),
                                    ],
                                  ),
                                ],
                              ),
                              CupertinoButton(
                                onPressed: null,
                                child: CupertinoContextMenu(
                                  child: Icon(
                                    Icons.more_vert,
                                    size: 24,
                                    color: AppColors.shadow.withOpacity(0.7),
                                  ),
                                  actions: [
                                    CupertinoContextMenuAction(
                                      child: const Text("Add to favorites"),
                                      onPressed: () {
                                        BlocProvider.of<BagBloc>(context).add(
                                            BagItemToFavoritesEvent(
                                                item: item));
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                    ),
                                    CupertinoContextMenuAction(
                                      child: const Text("Delete from the list"),
                                      onPressed: () {
                                        BlocProvider.of<BagBloc>(context).add(
                                            BagItemDeleteEvent(item: item));
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ]),
                        Row(
                          children: [
                            BagChangeCountButton(
                              iconData: Icons.remove,
                              onTap: () {
                                BlocProvider.of<BagBloc>(context).add(
                                    BagItemChangeCountEvent(
                                        item: item, count: -1));
                              },
                            ),
                            SizedBox(
                              width: 44,
                              child: Center(
                                child: Text(item.count.toStringAsFixed(0)),
                              ),
                            ),
                            BagChangeCountButton(
                              iconData: Icons.add,
                              onTap: () {
                                BlocProvider.of<BagBloc>(context, listen: false)
                                    .add(BagItemChangeCountEvent(
                                        item: item, count: 1));
                              },
                            ),
                            Expanded(child: Container()),
                            Text(
                              "${priceToString(item.sum)}\$",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    });

    if (itemsList.isEmpty) {
      itemsList = [
        const SizedBox(
          height: 40,
        ),
        const Image(image: AssetImage("assets/images/bag/bags.png")),
        const SizedBox(
          height: 40,
        ),
        RedButton(text: "TO CATALOGE"),
        const SizedBox(
          height: 16,
        ),
        const BorderedButton(
          text: "TO FAVORITES",
          color: Colors.black,
        ),
      ];
    } else {
      itemsList.addAll([
        const SizedBox(
          height: 25,
        ),
        PromocodeSearchFieldWidget(
          code: bag.promocode == null ? null : bag.promocode!.code,
          applyPromocode: () {
            BlocProvider.of<BagBloc>(context).add(BagPromocodeApplyEvent());
          },
          searchPromocode: (code) {
            BlocProvider.of<BagBloc>(context)
                .add(BagPromocodeSearchEvent(code: code));
          },
          showPromocodeMenu: () {
            BlocProvider.of<BagBloc>(context).add(BagPromocodeToSelectEvent());
            showCupertinoModalPopup<void>(
                context: context,
                builder: (context) => SelectPromocodeWidget(
                      searchPromocode: (code) {
                        BlocProvider.of<BagBloc>(context)
                            .add(BagPromocodeSearchEvent(code: code));
                      },
                    ));
          },
        ),
        const SizedBox(
          height: 28,
        ),
        SumRowWidget(
          sum: bag.itemsSum,
          title: "Total amount:",
        ),
        const SizedBox(
          height: 24,
        ),
        RedButton(
          text: "CHECK OUT",
          onTap: () {
            BlocProvider.of<BagBloc>(context).add(BagCheckOutTapEvent());
            Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(builder: (context) => const CheckoutPage()));
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ]);
    }

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: AppColors.mainColor,
          border: null,
          trailing: SearchBarButton(),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: 64,
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "My Bag",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ),
                ...itemsList,
              ],
            ),
          ),
        ));
  }
}
