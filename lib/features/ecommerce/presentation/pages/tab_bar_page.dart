// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/bag_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/home_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/profile_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/shop_page.dart';

import 'favorites_page.dart';

class _TabInfo {
  const _TabInfo(this.title, this.icon);

  final String title;
  final AssetImage icon;
}

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabInfo = [
      const _TabInfo(
        "Home",
        AssetImage("assets/icons/home.png"),
      ),
      const _TabInfo(
        "Shop",
        AssetImage("assets/icons/shop.png"),
      ),
      const _TabInfo(
        "Bag",
        AssetImage("assets/icons/bag.png"),
      ),
      const _TabInfo(
        "Favorites",
        AssetImage("assets/icons/favorites.png"),
      ),
      const _TabInfo(
        "Profile",
        AssetImage("assets/icons/profile.png"),
      ),
    ];

    return CupertinoTabScaffold(
      restorationId: 'cupertino_tab_scaffold',
      tabBar: CupertinoTabBar(
        activeColor: const Color.fromRGBO(219, 48, 34, 1),
        items: [
          for (final tabInfo in _tabInfo)
            BottomNavigationBarItem(
              label: tabInfo.title,
              icon: ImageIcon(tabInfo.icon),
            ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
            restorationScopeId: 'cupertino_tab_view_$index',
            builder: (context) {
              switch (index) {
                case 0:
                  return HomePage();
                case 1:
                  return ShopPage();
                case 2:
                  return BagPage();
                case 3:
                  return FavoritesPage();
                case 4:
                  return ProfilePage();
                default:
                  return Container();
              }
            });
      },
    );
  }
}

class _CupertinoDemoTab extends StatelessWidget {
  const _CupertinoDemoTab({
    Key? key,
    @required this.title = "",
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              //fontFamily: "Metropolis",
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
