import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Text(
          "Product page",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
