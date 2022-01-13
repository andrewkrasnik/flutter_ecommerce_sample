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
  bool isFavorite;
  String shortName;
  final bool isNew;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.brand,
      this.rating = 0,
      required this.price,
      this.salePrice = 0,
      this.sale = 0,
      this.reviewCount = 0,
      required this.images,
      this.isFavorite = false,
      this.isNew = false,
      this.shortName = ""}) {
    if (shortName.isEmpty) {
      shortName = name;
    }
  }
}
