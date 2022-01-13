import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class StarRatingWidget extends StatelessWidget {
  final Product product;
  const StarRatingWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> starList = [];
    for (var i = 0; i < 5; i++) {
      if (product.rating >= i + 1) {
        starList.add(const Icon(CupertinoIcons.star_fill,
            size: 14, color: Color(0xFFFFBA49)));
      } else {
        starList.add(const Icon(CupertinoIcons.star,
            size: 14, color: Color(0xFF9B9B9B)));
      }
      starList.add(const SizedBox(
        width: 2,
      ));
    }
    return Row(
      children: [
        ...starList,
        Text(
          "(${product.reviewCount.toString()})",
          style: const TextStyle(fontSize: 10, color: Color(0xFF9B9B9B)),
        )
      ],
    );
  }
}
