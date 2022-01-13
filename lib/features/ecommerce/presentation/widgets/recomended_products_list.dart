import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/product_card.dart';

class RecomendedProductsList extends StatelessWidget {
  final List<Product> productList;
  const RecomendedProductsList({Key? key, required this.productList})
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
              Text("You can also like this",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {},
                  child: Text("${productList.length} items",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Color(0xFF9B9B9B), fontSize: 11)))
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
