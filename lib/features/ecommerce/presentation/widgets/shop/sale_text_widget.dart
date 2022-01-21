import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class SaleTextWidget extends StatelessWidget {
  final Product product;

  const SaleTextWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.red,
      ),
      child: Center(
        child: Text(
          "-${product.sale.toStringAsFixed(0)}%",
          style: const TextStyle(
              fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
