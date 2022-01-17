import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/favorites/favorites_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/home/home_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/product/product_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/shop/shop_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/login_page.dart';
import 'features/ecommerce/presentation/pages/tab_bar_page.dart';
import 'locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<ShopPageCubit>(
              create: (context) => di.sl<ShopPageCubit>()),
          BlocProvider<LoginCubit>(create: (context) => di.sl<LoginCubit>()),
          BlocProvider<HomePageCubit>(
              create: (context) => di.sl<HomePageCubit>()..loadNewProducts()),
          BlocProvider<ProductCubit>(
              create: (context) =>
                  di.sl<ProductCubit>()..loadRecomendedProducts()),
          BlocProvider<FavoritesPageCubit>(
              create: (context) => di.sl<FavoritesPageCubit>()..loadList()),
          BlocProvider<BagBloc>(
            create: (context) => di.sl<BagBloc>(),
          )
        ],
        child: CupertinoApp(
          title: "eCommerce Sample",
          initialRoute: "/",
          routes: {
            "/": (context) => const LoginPage(),
            "/main": (context) => const TabBarPage(),
          },
          theme: CupertinoThemeData(
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

final Color _mainColor = Color(0xFFF9F9F9);

final TextStyle _textStyle =
    TextStyle(fontFamily: "Metropolis", color: Colors.black);

final CupertinoTextThemeData _textTheme = CupertinoTextThemeData(
  textStyle: _textStyle,
  actionTextStyle: _textStyle,
  tabLabelTextStyle: _textStyle,
  navTitleTextStyle: _textStyle,
  navLargeTitleTextStyle: _textStyle,
  navActionTextStyle: _textStyle,
  pickerTextStyle: _textStyle,
  dateTimePickerTextStyle: _textStyle,
);
