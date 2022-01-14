import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/catalog_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/category_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/favorites_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/products_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/repositories/categories_repository_impl.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/catalog_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/categories_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/favorites_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/products_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/delete_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/get_favorites.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_catalog_by_category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_categories_by_scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_new_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_products_by_catalog_Item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_recomended_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_sale_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/favorites/favorites_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/home/home_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/product/product_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/ecommerce/data/repositories/catalog_repository_impl.dart';
import 'features/ecommerce/data/repositories/favorites_repository_impl.dart';
import 'features/ecommerce/data/repositories/products_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc / Cubit
  sl.registerFactory(() => ShopPageCubit(
        getCategoriesBySCategory: sl(),
        getCatalogByCategory: sl(),
        getProductsByCatalogItem: sl(),
        addFavorite: sl(),
        getNewProducts: sl(),
        getSaleProducts: sl(),
      ));
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(
      () => HomePageCubit(getNewProducts: sl(), getSaleProducts: sl()));
  sl.registerFactory(
      () => ProductCubit(getRecomendedProducts: sl(), addFavorite: sl()));
  sl.registerFactory(
      () => FavoritesPageCubit(getFavorites: sl(), deleteFavorite: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetCategoriesBySCategory(sl()));
  sl.registerLazySingleton(() => GetCatalogByCategory(sl()));
  sl.registerLazySingleton(() => GetProductsByCatalogItem(sl()));
  sl.registerLazySingleton(() => GetSaleProducts(sl()));
  sl.registerLazySingleton(() => GetNewProducts(sl()));
  sl.registerLazySingleton(() => GetRecomendedProducts(sl()));
  sl.registerLazySingleton(() => GetFavorites(sl()));
  sl.registerLazySingleton(() => AddFavorite(sl()));
  sl.registerLazySingleton(() => DeleteFavorite(sl()));

  //Repository
  sl.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(sl()));
  sl.registerLazySingleton<CatalogRepository>(
      () => CatalogRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(sl()));
  sl.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(sl()));

  sl.registerLazySingleton<CategoryDataSource>(() => CategoryDataSourceImpl());
  sl.registerLazySingleton<CatalogDataSource>(() => CatalogDataSourceImpl());
  sl.registerLazySingleton<ProductsDataSource>(() => ProductsDataSourceImpl());
  sl.registerLazySingleton<FavoritesDataSource>(
      () => FavoritesDataSourceImpl());
}
