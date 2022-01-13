import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/info_wiget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

import 'shop/filter_color_button.dart';

class SelectColorWidget extends StatelessWidget {
  final Color? selectedColor;
  const SelectColorWidget({Key? key, this.selectedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      const Color(0xFF020202),
      const Color(0xFFF6F6F6),
      const Color(0xFFB82222),
      const Color(0xFFBEA9A9),
      const Color(0xFFE2BB8D),
      const Color(0xFF151867),
    ];

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
              children: colors
                  .map((color) => FilterColorButton(
                        color: color,
                        selected: color == selectedColor,
                        onTap: () {},
                      ))
                  .toList(),
            )),
        const SizedBox(
          height: 16,
        ),
        const InfoWiget(text: "Color info"),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RedButton(text: "ADD TO CARD"),
        ),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
