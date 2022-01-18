import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class PromocodeSearchFieldWidget extends StatefulWidget {
  final String? code;
  final VoidCallback showPromocodeMenu;
  final Function(String) searchPromocode;
  final VoidCallback applyPromocode;
  PromocodeSearchFieldWidget({
    Key? key,
    required this.showPromocodeMenu,
    required this.applyPromocode,
    required this.searchPromocode,
    this.code,
  }) : super(key: key);

  @override
  State<PromocodeSearchFieldWidget> createState() =>
      _PromocodeSearchFieldWidgetState();
}

class _PromocodeSearchFieldWidgetState
    extends State<PromocodeSearchFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.code == null) {
      return SizedBox(
        child: Stack(children: [
          CupertinoTextField(
            controller: controller,
            decoration: BoxDecoration(
                border: null,
                color: AppColors.white,
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8), right: Radius.circular(19))),
            suffix: GestureDetector(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  widget.searchPromocode(controller.text);
                } else {
                  widget.showPromocodeMenu();
                }
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.black),
                child: Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: AppColors.white,
                ),
              ),
            ),
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
            placeholder: "Enter your promo code",
            placeholderStyle: TextStyle(color: AppColors.grayText),
          ),
        ]),
      );
    }
    controller.text = "";
    return CupertinoTextField(
      controller: controller,
      readOnly: true,
      placeholder: widget.code,
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
      placeholderStyle: TextStyle(color: AppColors.black, fontSize: 14),
      decoration: BoxDecoration(
          border: null,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8)),
      suffix: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: GestureDetector(
          onTap: () {
            widget.applyPromocode();
          },
          child: Icon(
            Icons.close,
            color: AppColors.grayText,
            size: 24,
          ),
        ),
      ),
    );
  }
}
