import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class FavoriteIconButton extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const FavoriteIconButton({Key? key, required this.product, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: product.isFavorite
              ? const Icon(
                  Icons.favorite,
                  color: AppColors.red,
                  size: 16,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 16,
                )),
    );
  }
}
