import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class CaptionFieldWidget extends StatelessWidget {
  final String caption;
  final String text;
  const CaptionFieldWidget(
      {Key? key, required this.caption, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(caption,
            style: TextStyle(fontSize: 11, color: AppColors.grayText)),
        const SizedBox(
          width: 4,
        ),
        Text(text,
            style: const TextStyle(
              fontSize: 11,
            ))
      ],
    );
  }
}
