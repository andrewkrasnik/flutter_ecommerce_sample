import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/sort_types.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';

class SortTypeListWiget extends StatelessWidget {
  final void Function(BuildContext, SortType) changeSortType;
  final SortType selectedSortType;
  const SortTypeListWiget(
      {Key? key, required this.changeSortType, required this.selectedSortType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 332,
      padding: const EdgeInsets.only(top: 6),
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
              itemCount: SortTypes.values.length,
              itemBuilder: (BuildContext context, int index) {
                final bool selected =
                    SortTypes.values[index] == selectedSortType;
                return GestureDetector(
                  onTap: () {
                    changeSortType(context, SortTypes.values[index]);
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
                      SortTypes.values[index].name,
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
