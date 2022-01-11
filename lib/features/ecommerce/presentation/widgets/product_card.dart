import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/product_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/favorite_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/new_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/price_text_wiget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/sale_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';

import 'circle_bordered_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductPage(product: product)));
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 266,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleBorderedImage(
                    height: 184,
                    width: 148,
                    image: product.images[0],
                    topLeft: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomRight: const Radius.circular(10)),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    StarRatingWidget(product.rating),
                    Text(
                      "(${product.reviewCount.toString()})",
                      style: const TextStyle(
                          fontSize: 10, color: Color(0xFF9B9B9B)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  product.brand.name,
                  style:
                      const TextStyle(fontSize: 11, color: Color(0xFF9B9B9B)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                PriceTextWiget(product: product),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 9,
            child: product.sale == 0
                ? const NewTextWidget()
                : SaleTextWidget(product: product),
          ),
          Positioned(
              right: 0, top: 160, child: FavoriteIconButton(product: product))
        ],
      ),
    );
  }
}