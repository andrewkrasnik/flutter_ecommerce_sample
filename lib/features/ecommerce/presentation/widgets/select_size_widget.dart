import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/info_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

import 'shop/filter_button.dart';

class SelectSizeWidget extends StatefulWidget {
  Product product;
  ProductSize? selectedSize;
  final void Function(ProductSize)? selectSize;
  final String buttonTitle;
  final void Function(ProductSize)? redButtonCallBack;
  SelectSizeWidget(
      {Key? key,
      this.selectedSize,
      required this.product,
      this.buttonTitle = "ADD TO CARD",
      this.redButtonCallBack,
      this.selectSize})
      : super(key: key);

  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> sizeWigets = widget.product.sizes
        .map((size) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: FilterButton(
                  text: size.name,
                  selected: size == widget.selectedSize,
                  width: 100,
                  height: 40,
                  borderRadius: 10,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.shadow,
                  onTap: () {
                    if (widget.selectSize != null) {
                      widget.selectSize!(size);
                    }
                    setState(() {
                      widget.selectedSize = size;
                    });
                  }),
            ))
        .toList();

    return Container(
      height: 360,
      width: double.maxFinite,
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
          "Select size",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          height: 112,
          child: Column(children: [
            Row(
              children: sizeWigets.sublist(0, 3),
            ),
            Row(
              children: sizeWigets.sublist(3, 5),
            ),
          ]),
        ),
        const SizedBox(
          height: 16,
        ),
        const InfoWidget(text: "Size info"),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RedButton(
            text: widget.buttonTitle,
            onTap: () {
              if (widget.redButtonCallBack != null) {
                widget.redButtonCallBack!(widget.selectedSize!);
              }
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
