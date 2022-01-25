import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class BlackAddButton extends StatelessWidget {
  final VoidCallback? onTap;

  const BlackAddButton({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: AppColors.black,
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            )));
  }
}
