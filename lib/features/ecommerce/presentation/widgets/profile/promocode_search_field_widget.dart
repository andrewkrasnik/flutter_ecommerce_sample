import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class PromocodeSearchFieldWidget extends StatelessWidget {
  final String? code;
  final VoidCallback? onPressed;
  const PromocodeSearchFieldWidget({Key? key, this.onPressed, this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (code == null) {
      return SizedBox(
        child: Stack(children: [
          CupertinoTextField(
            decoration: BoxDecoration(
                border: null,
                color: AppColors.white,
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8), right: Radius.circular(19))),
            suffix: GestureDetector(
              onTap: onPressed,
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
    return CupertinoTextField(
      readOnly: true,
      placeholder: code,
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
      placeholderStyle: TextStyle(color: AppColors.black, fontSize: 14),
      decoration: BoxDecoration(
          border: null,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8)),
      suffix: CupertinoButton(
          borderRadius: null,
          padding: null,
          minSize: 0,
          child: Icon(
            Icons.close,
            color: AppColors.grayText,
            size: 24,
          ),
          onPressed: onPressed),
    );
  }
}
