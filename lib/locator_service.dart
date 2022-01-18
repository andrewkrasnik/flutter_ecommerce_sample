import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/bag_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/catalog_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/category_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/delivery_methods_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/favorites_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/products_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/data/repositories/categories_repository_impl.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/catalog_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/categories_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_methods_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/favorites_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/products_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/promocode_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/add_to_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/apply_promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/change_item_count.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/delete_from_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/get_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/get_delivery_methods.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/get_promocodes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/search_promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/delete_favorite.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/get_favorites.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_catalog_by_category.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_categories_by_scategory.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_new_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_products_by_catalog_Item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_recomended_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_sale_products.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/add_delivery_adress.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/add_payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_delivery_adresses.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_payment_methods.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/favorites/favorites_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/home/home_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/product/product_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/ecommerce/data/datasources/promocode_data_source.dart';
import 'features/ecommerce/data/repositories/bag_repository_impl.dart';
import 'features/ecommerce/data/repositories/catalog_repository_impl.dart';
import 'features/ecommerce/data/repositories/delivery_methods_repository_impl.dart';
import 'features/ecommerce/data/repositories/favorites_repository_impl.dart';
import 'features/ecommerce/data/repositories/products_repository_impl.dart';
import 'features/ecommerce/data/repositories/promocode_repository_impl.dart';

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
  sl.registerFactory(() => HomePageCubit(
        getNewProducts: sl(),
        getSaleProducts: sl(),
        addFavorite: sl(),
      ));
  sl.registerFactoryParam<ProductCubit, Product, int>(
      ((Product product, int _) => ProductCubit(
            product: product,
            getRecomendedProducts: sl(),
            addFavorite: sl(),
            addToBag: sl(),
          )));
  sl.registerFactory(() => FavoritesPageCubit(
        getFavorites: sl(),
        deleteFavorite: sl(),
        addToBag: sl(),
      ));
  sl.registerFactory(
    () => BagBloc(
      getBag: sl(),
      deleteFromBag: sl(),
      changeItemCount: sl(),
      getDeliveryMethods: sl(),
      addFavorite: sl(),
      getPromocodes: sl(),
      applyPromocode: sl(),
      searchPromocode: sl(),
    ),
  );

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
  sl.registerLazySingleton(() => AddToBag(sl()));
  sl.registerLazySingleton(() => GetBag(sl()));
  sl.registerLazySingleton(() => DeleteFromBag(sl()));
  sl.registerLazySingleton(() => ChangeItemCount(sl()));
  sl.registerLazySingleton(() => ApplyPromocode(sl()));
  sl.registerLazySingleton(() => GetDeliveryMethods(sl()));
  sl.registerLazySingleton(() => GetPromocodes(sl()));
  sl.registerLazySingleton(() => AddDeliveryAdress(sl()));
  sl.registerLazySingleton(() => AddPaymentsMethod(sl()));
  sl.registerLazySingleton(() => GetDeliveryAdresses(sl()));
  sl.registerLazySingleton(() => GetPaymentsMethods(sl()));
  sl.registerLazySingleton(() => SearchPromocode(sl(), sl()));

  //Repository
  sl.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(sl()));
  sl.registerLazySingleton<CatalogRepository>(
      () => CatalogRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(sl()));
  sl.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(sl()));
  sl.registerLazySingleton<BagRepository>(() => BagRepositoryImpl(sl()));
  sl.registerLazySingleton<DeliveryMethodsRepository>(
      () => DeliveryMethodsRepositoryImpl(sl()));
  sl.registerLazySingleton<PromocodeRepository>(
      () => PromocodeRepositoryImpl(sl()));

  sl.registerLazySingleton<CategoryDataSource>(() => CategoryDataSourceImpl());
  sl.registerLazySingleton<CatalogDataSource>(() => CatalogDataSourceImpl());
  sl.registerLazySingleton<ProductsDataSource>(() => ProductsDataSourceImpl());
  sl.registerLazySingleton<FavoritesDataSource>(
      () => FavoritesDataSourceImpl());
  sl.registerLazySingleton<BagDataSource>(() => BagDataSourceImpl());
  sl.registerLazySingleton<DeliveryMethodsDataSource>(
      () => DeliveryMethodsDataSourceImpl());
  sl.registerLazySingleton<PromocodeDataSource>(
      () => PromocodeDataSourceImpl());
}
