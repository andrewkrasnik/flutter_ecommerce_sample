// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/bag_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/home_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/profile_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/filters_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/shop_page.dart';

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
          activeColor: const Color.fromRGBO(219, 48, 34, 1),
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
              currentPage = ShopPage();
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
              },
              builder: (context) {
                return currentPage;
              });
        },
      ),
    );
  }
}
