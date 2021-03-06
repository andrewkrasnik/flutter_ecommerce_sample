import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';

import '../search_bar_button.dart';

CupertinoNavigationBar shopAppBar(
    {required BuildContext context, String title = "", bool noBorder = false}) {
  return CupertinoNavigationBar(
    border: noBorder
        ? null
        : const Border(
            bottom: BorderSide(
              color: Color(0x4D000000),
              width: 0.0, // One physical pixel.
              style: BorderStyle.solid,
            ),
          ),
    leading: CupertinoButton(
        padding: const EdgeInsets.only(bottom: 4),
        onPressed: () {
          BlocProvider.of<ShopPageCubit>(context).goBack(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        )),
    middle: title.isEmpty
        ? Container()
        : Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
    trailing: const SearchBarButton(),
  );
}
