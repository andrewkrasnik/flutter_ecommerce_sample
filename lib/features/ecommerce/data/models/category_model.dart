import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/scategory.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required int id,
      required String name,
      required String image,
      required SCategory sCategory})
      : super(id: id, name: name, image: image, sCategory: sCategory);
}
