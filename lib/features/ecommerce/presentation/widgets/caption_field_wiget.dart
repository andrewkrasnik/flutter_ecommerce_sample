import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class CaptionFieldWiget extends StatelessWidget {
  final String caption;
  final String text;
  const CaptionFieldWiget({Key? key, required this.caption, required this.text})
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
            style: TextStyle(
              fontSize: 11,
            ))
      ],
    );
  }
}
