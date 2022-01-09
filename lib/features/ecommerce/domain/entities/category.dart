import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final SCategory sCategory;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.sCategory,
  });
}
