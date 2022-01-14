import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/shop_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/product_card.dart';

class NewProductsList extends StatelessWidget {
  final List<Product> productList;
  const NewProductsList({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("New",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "You’ve never seen it before!",
                    style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 11),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ShopPage.newProducts()));
                  },
                  child: const Text("View all",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.black, fontSize: 11)))
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product product = productList[index];
                  return ProductCard(
                    product: product,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                itemCount: productList.length),
          ),
        ],
      ),
    );
  }
}
