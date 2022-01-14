import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class SortTypes {
  static final popular = SortType("Popular");
  static final newest = SortType("Newest");
  static final customerReview = SortType("Customer review");
  static final priceLowest = SortType("Price: lowest to high");
  static final priceHighest = SortType("Price: highest to low");

  static List<SortType> get values {
    return [popular, newest, customerReview, priceLowest, priceHighest];
  }
}

class SortType {
  final String name;
  SortType(this.name);
}
