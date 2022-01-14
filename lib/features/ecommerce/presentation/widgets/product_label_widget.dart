import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/new_text_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/sale_text_widget.dart';

class ProductLabelWidget extends StatelessWidget {
  final Product product;
  const ProductLabelWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product.isNew) {
      return const NewTextWidget();
    } else if (product.salePrice > 0) {
      return SaleTextWidget(product: product);
    }
    return Container();
  }
}
