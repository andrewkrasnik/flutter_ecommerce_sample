import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';

class SortTypeListWiget extends StatelessWidget {
  const SortTypeListWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> sortTypeList = [
      "Popular",
      "Newest",
      "Customer review",
      "Price: lowest to high",
      "Price: highest to low",
    ];
    return Container(
      height: 332,
      padding: EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
          color: CupertinoColors.systemBackground.resolveFrom(context),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 60,
          height: 6,
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        ),
        const Text(
          "Sort by",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: sortTypeList.length,
              itemBuilder: (BuildContext context, int index) {
                final bool selected = sortTypeList[index] ==
                    (BlocProvider.of<ShopPageCubit>(context).state
                            as ShopPageProductList)
                        .sortBy;
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<ShopPageCubit>(context)
                        .changeSortType(context, sortTypeList[index]);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 48,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16),
                    color: selected
                        ? const Color.fromRGBO(219, 48, 34, 1)
                        : CupertinoColors.systemBackground.resolveFrom(context),
                    child: Text(
                      sortTypeList[index],
                      style: TextStyle(
                          fontSize: 16,
                          color: selected ? Colors.white : Colors.black,
                          fontWeight:
                              selected ? FontWeight.bold : FontWeight.normal),
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
