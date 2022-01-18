import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/promocode_search_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/promocode_tile_widget.dart';

class SelectPromocodeWidget extends StatefulWidget {
  const SelectPromocodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectPromocodeWidget> createState() => _SelectPromocodeWidgetState();
}

class _SelectPromocodeWidgetState extends State<SelectPromocodeWidget> {
  late List<Promocode> promocodeList;
  @override
  Widget build(BuildContext context) {
    promocodeList = (BlocProvider.of<BagBloc>(context).state as BagPageState)
            .promocodeList ??
        [];
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 10) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
              width: 60,
              height: 6,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const PromocodeSearchFieldWidget(),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Your Promo codes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: promocodeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PromocodeTileWidget(
                      promocode: promocodeList[index],
                      onTap: () {
                        BlocProvider.of<BagBloc>(context).add(
                            BagPromocodeApplyEvent(
                                promocode: promocodeList[index]));
                        Navigator.of(context).pop();
                      },
                    );
                  })),
          const SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
