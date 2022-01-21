import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/core/utils/formating.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class PriceTextWiget extends StatelessWidget {
  final Product product;
  final double fontSize;
  const PriceTextWiget({Key? key, required this.product, this.fontSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product.salePrice == 0.0) {
      return Text(
        "${priceToString(product.price)}\$",
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      );
    } else {
      return Row(
        children: [
          Text(
            "${priceToString(product.price)}\$",
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.grayText,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 6),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "${priceToString(product.salePrice)}\$",
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.red,
            ),
          )
        ],
      );
    }
  }
}
