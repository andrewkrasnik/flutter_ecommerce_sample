import 'package:flutter/cupertino.dart';
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
        "${product.price.toStringAsFixed(0)}\$",
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      );
    } else {
      return Row(
        children: [
          Text(
            "${product.price.toStringAsFixed(0)}\$",
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF9B9B9B),
                decoration: TextDecoration.lineThrough,
                decorationThickness: 6),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "${product.salePrice.toStringAsFixed(0)}\$",
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(219, 48, 34, 1)),
          )
        ],
      );
    }
  }
}
