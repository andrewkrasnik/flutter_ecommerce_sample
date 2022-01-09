import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';

class CatalogItemModel extends CatalogItem {
  CatalogItemModel(
      {required int id,
      required String name,
      required String fullName,
      required Category category})
      : super(id: id, name: name, fullName: fullName, category: category);
}
