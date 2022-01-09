import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/brand.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final Brand brand;
  final int rating;
  final List<String> images;
  final double price;
  final double salePrice;
  final double sale;
  final int reviewCount;
  final bool isFavorite;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.rating,
    required this.price,
    required this.salePrice,
    required this.sale,
    required this.reviewCount,
    required this.images,
    required this.isFavorite,
  });
}
