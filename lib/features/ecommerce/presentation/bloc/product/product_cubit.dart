import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_recomended_products.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetRecomendedProducts getRecomendedProducts;
  ProductCubit({required this.getRecomendedProducts})
      : super(ProductPageState(recomendedProducts: []));

  void loadRecomendedProducts() async {
    emit(ProductPageState(recomendedProducts: []));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(ProductPageState(recomendedProducts: await getRecomendedProducts()));
  }

  void selectSize(String selectedSize) {
    emit(
      ProductPageState(
          recomendedProducts: (state as ProductPageState).recomendedProducts,
          size: selectedSize,
          color: (state as ProductPageState).color),
    );
  }

  void selectColor(String selectedColor) {
    emit(
      ProductPageState(
          recomendedProducts: (state as ProductPageState).recomendedProducts,
          size: (state as ProductPageState).size,
          color: selectedColor),
    );
  }
}
