import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool withBorder;
  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.withBorder = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: withBorder
              ? const Border(
                  bottom: BorderSide(width: 0.1),
                )
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 11, color: AppColors.grayText),
              ),
            ],
          ),
          CupertinoButton(
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.shadow,
                size: 18,
              ),
              onPressed: onTap)
        ],
      ),
    );
  }
}
