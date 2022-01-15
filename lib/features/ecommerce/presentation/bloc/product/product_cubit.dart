import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/add_to_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_recomended_products.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetRecomendedProducts getRecomendedProducts;
  final AddFavorite addFavorite;
  final AddToBag addToBag;

  ProductCubit({
    required this.getRecomendedProducts,
    required this.addFavorite,
    required this.addToBag,
  }) : super(ProductPageState(recomendedProducts: []));

  void loadRecomendedProducts() async {
    emit(ProductPageState(recomendedProducts: []));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(ProductPageState(recomendedProducts: await getRecomendedProducts()));
  }

  void selectSize(ProductSize selectedSize) {
    emit((state as ProductPageState).copyWith(size: selectedSize));
  }

  void selectColor(ProductColor selectedColor) {
    emit((state as ProductPageState).copyWith(color: selectedColor));
  }

  void addToFavorites(Product product) async {
    if (!product.isFavorite) {
      await addFavorite(Favorite(
          product: product,
          size: (state as ProductPageState).size!,
          color: (state as ProductPageState).color!));
      product.isFavorite = true;
      await Future.delayed(const Duration(milliseconds: 500));
      emit((state as ProductPageState)
          .copyWith(recomendedProducts: await getRecomendedProducts()));
    }
  }

  void addToCart(
      {required Product product,
      required ProductSize size,
      required ProductColor color}) async {
    addToBag(product: product, size: size, color: color);
  }
}
