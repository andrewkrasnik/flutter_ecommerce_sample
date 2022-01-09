import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/brand.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String name,
    required String description,
    required Brand brand,
    required int rating,
    required double price,
    required double salePrice,
    required double sale,
    required int reviewCount,
    required List<String> images,
    required bool isFavorite,
  }) : super(
            id: id,
            name: name,
            description: description,
            brand: brand,
            rating: rating,
            price: price,
            salePrice: salePrice,
            sale: sale,
            reviewCount: reviewCount,
            images: images,
            isFavorite: isFavorite);
}
