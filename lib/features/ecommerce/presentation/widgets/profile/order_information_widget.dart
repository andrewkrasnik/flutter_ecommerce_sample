import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class OrderInformationWidget extends StatelessWidget {
  final String text;
  final String title;
  final Widget? child;
  const OrderInformationWidget({
    Key? key,
    this.text = "",
    required this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 132,
          child: Text(
            title,
            style: const TextStyle(color: AppColors.grayText),
          ),
        ),
        child ??
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  textDirection: TextDirection.ltr,
                  softWrap: true),
            )
      ],
    );
  }
}
