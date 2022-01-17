import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_new_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_sale_products.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final GetNewProducts getNewProducts;
  final GetSaleProducts getSaleProducts;
  final AddFavorite addFavorite;

  HomePageCubit({
    required this.getNewProducts,
    required this.getSaleProducts,
    required this.addFavorite,
  }) : super(HomePageInitial(newProductsList: []));

  void loadNewProducts() async {
    emit(HomePageInitial(newProductsList: []));
    await Future.delayed(const Duration(milliseconds: 500));
    List<Product> newProductList = await getNewProducts();
    emit(HomePageInitial(newProductsList: newProductList));
  }

  void checkSales() async {
    emit(HomePageSales(newProductsList: [], saleProductsList: []));
    await Future.delayed(const Duration(milliseconds: 500));

    emit(HomePageSales(
        newProductsList: await getNewProducts(),
        saleProductsList: await getSaleProducts()));
  }

  void addToFavorites(
      {required Product product, required ProductSize size}) async {
    await addFavorite(product: product, size: size, color: product.colors[0]);
    reload();
  }

  void reload() {
    emit(state.copyWith());
  }
}
