import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';

class CatalogItem {
  final int id;
  final String name;
  final String fullName;
  final Category category;

  CatalogItem({
    required this.id,
    required this.name,
    required this.fullName,
    required this.category,
  });
}
