part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductPageState extends ProductState {
  final List<Product> recomendedProducts;
  final ProductSize? size;
  final ProductColor? color;
  ProductPageState({
    required this.recomendedProducts,
    this.size,
    this.color,
  });

  ProductPageState copyWith({
    List<Product>? recomendedProducts,
    ProductSize? size,
    ProductColor? color,
  }) {
    return ProductPageState(
      recomendedProducts: recomendedProducts ?? this.recomendedProducts,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }
}
