import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/info_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

import 'shop/filter_color_button.dart';

class SelectColorWidget extends StatefulWidget {
  ProductColor? selectedColor;
  void Function(ProductColor) selectColor;
  final Product product;
  final void Function()? redButtonCallBack;
  SelectColorWidget(
      {Key? key,
      this.selectedColor,
      required this.product,
      required this.selectColor,
      this.redButtonCallBack})
      : super(key: key);

  @override
  State<SelectColorWidget> createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dy > 10) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
          height: 360,
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 6),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: 60,
              height: 6,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            ),
            const Text(
              "Select color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                height: 82,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.product.colors
                      .map((color) => FilterColorButton(
                            color: color.color,
                            selected: color == widget.selectedColor,
                            onTap: () {
                              widget.selectColor(color);
                              setState(() {
                                widget.selectedColor = color;
                              });
                            },
                          ))
                      .toList(),
                )),
            const SizedBox(
              height: 16,
            ),
            const InfoWidget(text: "Color info"),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RedButton(
                text: "ADD TO CARD",
                onTap: () {
                  if (widget.redButtonCallBack != null) {
                    widget.redButtonCallBack!();
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
        ));
  }
}
