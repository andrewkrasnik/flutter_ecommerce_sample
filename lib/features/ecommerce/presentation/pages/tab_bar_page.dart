// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/favorites/favorites_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/home/home_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/profile/profile_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/bag_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/home_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/order_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/orders_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/payment_methods_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/profile_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/promocodes_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/reviews_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/settings_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/shipping_addresses_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/filters_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/shop_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/visual_search_page.dart';

import 'favorites_page.dart';

class _TabInfo {
  const _TabInfo(this.title, this.icon, this.activeIcon);

  final String title;
  final AssetImage icon;
  final AssetImage activeIcon;
}

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabInfo = [
      const _TabInfo(
        "Home",
        AssetImage("assets/icons/home.png"),
        AssetImage("assets/icons/home_active.png"),
      ),
      const _TabInfo(
        "Shop",
        AssetImage("assets/icons/shop.png"),
        AssetImage("assets/icons/shop_active.png"),
      ),
      const _TabInfo(
        "Bag",
        AssetImage("assets/icons/bag.png"),
        AssetImage("assets/icons/bag_active.png"),
      ),
      const _TabInfo(
        "Favorites",
        AssetImage("assets/icons/favorites.png"),
        AssetImage("assets/icons/favorites_active.png"),
      ),
      const _TabInfo(
        "Profile",
        AssetImage("assets/icons/profile.png"),
        AssetImage("assets/icons/profile_active.png"),
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CupertinoTabScaffold(
        //controller: CupertinoTabController(),
        restorationId: 'cupertino_tab_scaffold',
        tabBar: CupertinoTabBar(
          activeColor: AppColors.red,
          onTap: (value) {
            if (value == 0) {
              BlocProvider.of<HomePageCubit>(context).reload();
            } else if (value == 2) {
              if (BlocProvider.of<BagBloc>(context).state is BagPageState) {
                BlocProvider.of<BagBloc>(context).add(BagInitListEvent());
              }
            } else if (value == 3) {
              BlocProvider.of<FavoritesPageCubit>(context).loadList();
            } else if (value == 4) {
              BlocProvider.of<ProfileCubit>(context).updateStatistic();
            }
          },
          items: [
            for (final tabInfo in _tabInfo)
              BottomNavigationBarItem(
                label: tabInfo.title,
                icon: ImageIcon(tabInfo.icon),
                activeIcon: ImageIcon(tabInfo.activeIcon),
              ),
          ],
        ),
        tabBuilder: (context, index) {
          Widget currentPage = Container();
          switch (index) {
            case 0:
              currentPage = HomePage();
              break;
            case 1:
              currentPage = ShopPage(
                context: context,
              );
              break;
            case 2:
              currentPage = BagPage();
              break;
            case 3:
              currentPage = FavoritesPage();
              break;
            case 4:
              currentPage = ProfilePage();
              break;
            default:
              currentPage = Container();
          }

          return CupertinoTabView(
              routes: {
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
              builder: (context) {
                return currentPage;
              });
        },
      ),
    );
  }
}
