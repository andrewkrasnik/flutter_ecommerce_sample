part of 'product_cubit.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductPageState extends ProductState {
  //final Product product;
  final List<Product> recomendedProducts;
  final ProductSize? size;
  final ProductColor? color;
  final bool? isFavorite;
  ProductPageState({
    //required this.product,
    required this.recomendedProducts,
    this.isFavorite,
    this.size,
    this.color,
  });

  ProductPageState copyWith({
    List<Product>? recomendedProducts,
    ProductSize? size,
    ProductColor? color,
    bool? isFavorite,
    // Product? product
  }) {
    return ProductPageState(
      recomendedProducts: recomendedProducts ?? this.recomendedProducts,
      size: size ?? this.size,
      color: color ?? this.color,
      isFavorite: isFavorite ?? this.isFavorite,
      //product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [recomendedProducts, size, color, isFavorite];
}
