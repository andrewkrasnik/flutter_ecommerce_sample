import 'package:flutter/material.dart';

import 'features/ecommerce/presentation/pages/tab_bar_page.dart';

void main() {
  runApp(MaterialApp(
    title: "eCommerce Sample",
    home: TabBarPage(),
    theme: ThemeData.light(),
  ));
}
