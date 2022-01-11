import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class FavoriteIconButton extends StatelessWidget {
  final Product product;

  const FavoriteIconButton({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  color: Color.fromRGBO(219, 48, 34, 1),
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
