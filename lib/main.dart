import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/favorites/favorites_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/home/home_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/profile/profile_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/ecommerce/presentation/pages/profile/order_page.dart';
import 'features/ecommerce/presentation/pages/profile/orders_page.dart';
import 'features/ecommerce/presentation/pages/profile/payment_methods_page.dart';
import 'features/ecommerce/presentation/pages/profile/promocodes_page.dart';
import 'features/ecommerce/presentation/pages/profile/reviews_page.dart';
import 'features/ecommerce/presentation/pages/profile/settings_page.dart';
import 'features/ecommerce/presentation/pages/profile/shipping_addresses_page.dart';
import 'features/ecommerce/presentation/pages/shop/filters_page.dart';
import 'features/ecommerce/presentation/pages/tab_bar_page.dart';
import 'features/ecommerce/presentation/pages/visual_search_page.dart';
import 'locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<ShopPageCubit>(
              create: (context) => di.sl<ShopPageCubit>()..init()),
          BlocProvider<LoginCubit>(create: (context) => di.sl<LoginCubit>()),
          BlocProvider<HomePageCubit>(
              create: (context) => di.sl<HomePageCubit>()..loadNewProducts()),
          BlocProvider<FavoritesPageCubit>(
              create: (context) => di.sl<FavoritesPageCubit>()..loadList()),
          BlocProvider<BagBloc>(create: (context) => di.sl<BagBloc>()),
          BlocProvider<ProfileCubit>(
              create: (context) => di.sl<ProfileCubit>()..updateStatistic()),
        ],
        child: CupertinoApp(
          title: "eCommerce Sample",
          initialRoute: "/",
          routes: {
            "/": (context) => const LoginPage(),
            "/main": (context) => const TabBarPage(),
            "/filters": (context) => FiltersPage(),
            "/settings": (context) => SettingsPage(),
            "/promocodes": (context) => PromocodesPage(),
            "/adresses": (context) => ShippingAdressesPage(),
            "/payments": (context) => PaymentsMethodsPage(),
            "/reviews": (context) => ReviewsPage(),
            "/orders": (context) => OrdersPage(),
            "/search": (context) => VisualSearchPage(),
            // "/adress": (context) => ShippingAddressPage(),
            "/order": (context) => OrderPage(),
            // "/product": (context) => ProductPage(product: product),
          },
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          theme: const CupertinoThemeData(
            textTheme: _textTheme,
            scaffoldBackgroundColor: _mainColor,
            primaryColor: _mainColor,
            brightness: Brightness.light,
            primaryContrastingColor: Colors.black,
            barBackgroundColor: Colors.white,
          ),
        )),
  );
}

const Color _mainColor = AppColors.mainColor;

const TextStyle _textStyle =
    TextStyle(fontFamily: "Metropolis", color: AppColors.black);

const CupertinoTextThemeData _textTheme = CupertinoTextThemeData(
  textStyle: _textStyle,
  actionTextStyle: _textStyle,
  tabLabelTextStyle: _textStyle,
  navTitleTextStyle: _textStyle,
  navLargeTitleTextStyle: _textStyle,
  navActionTextStyle: _textStyle,
  pickerTextStyle: _textStyle,
  dateTimePickerTextStyle: _textStyle,
);
