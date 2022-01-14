import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/brand.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';

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
  final bool outOfStock;
  // late List<ProductColor> colors;
  // late List<ProductSize> sizes;
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
      this.outOfStock = false,
      this.shortName = ""}) {
    if (shortName.isEmpty) {
      shortName = name;
    }
  }
  List<ProductColor> get colors => ProductColors.values;
  List<ProductSize> get sizes => ProductSizes.values;
}
