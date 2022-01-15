import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bag_change_count_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/caption_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/circle_bordered_image.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';

class BagListPage extends StatelessWidget {
  const BagListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BagBloc>().state;
    Bag bag = (state as BagPageState).bag;

    List<Widget> itemsList = List.generate(bag.itemCount, (int index) {
      BagItem item = bag.getItem(index);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(top: 16, right: 2),
            height: 104,
            width: double.maxFinite,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: AppColors.shadow.withOpacity(0.3),
                spreadRadius: 0.2,
                offset: Offset(2, -1),
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBorderedImage(
                    height: 104,
                    width: 100,
                    image: item.product.images[0],
                    topLeft: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: CaptionFieldWidget(
                                              caption: "Color",
                                              text: item.color.name),
                                        ),
                                        CaptionFieldWidget(
                                            caption: "Size",
                                            text: item.size.name),
                                      ],
                                    ),
                                  ],
                                ),
                                CupertinoButton(
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 24,
                                      color: AppColors.shadow.withOpacity(0.7),
                                    ),
                                    onPressed: () {})
                              ]),
                          Row(
                            children: [
                              BagChangeCountButton(
                                iconData: Icons.remove,
                                onTap: () {
                                  BlocProvider.of<BagBloc>(context,
                                          listen: false)
                                      .add(BagChangeItemCountEvent(
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
                                  BlocProvider.of<BagBloc>(context,
                                          listen: false)
                                      .add(BagChangeItemCountEvent(
                                          item: item, count: 1));
                                },
                              ),
                              Expanded(child: Container()),
                              Text(
                                "${item.sum.toStringAsFixed(0)}\$",
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
          )
        ]),
      );
    });

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.mainColor,
          border: null,
          trailing: SearchBarButton(
            onPressed: () {
              BlocProvider.of<BagBloc>(context, listen: false)
                  .add(BagInitListEvent());
            },
          ),
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
                const SizedBox(
                  height: 25,
                ),
                CupertinoTextField(),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total amount:",
                      style: TextStyle(color: AppColors.grayText),
                    ),
                    Text(
                      "${bag.itemsSum}\$",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                RedButton(text: "CHECK OUT"),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}