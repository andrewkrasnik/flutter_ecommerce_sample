part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductPageState extends ProductState {
  final List<Product> recomendedProducts;
  final String size;
  final String color;
  ProductPageState({
    required this.recomendedProducts,
    this.size = "Size",
    this.color = "",
  });
}
