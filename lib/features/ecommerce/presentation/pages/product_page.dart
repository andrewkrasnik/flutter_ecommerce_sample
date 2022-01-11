import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/info_wiget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/favorite_icon_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/price_text_wiget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(
        product.shortName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 413,
              width: double.maxFinite,
              child: ListView.builder(
                  itemCount: product.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Image(
                        image: AssetImage(product.images[index]),
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [FavoriteIconButton(product: product)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.brand.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(product.name,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.grayText,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      StarRatingWidget(product),
                    ],
                  ),
                  PriceTextWiget(
                    product: product,
                    fontSize: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(product.description,
                  style: const TextStyle(fontSize: 14)),
            ),
            Container(
              height: 112,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, -1))
              ]),
              child: RedButton(
                text: "ADD TO CARD",
                height: 48,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InfoWiget(text: "Shipping info"),
            InfoWiget(text: "Support"),
          ],
        ),
      ),
    );
  }
}
