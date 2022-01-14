import 'package:flutter/material.dart';

class ProductColors {
  static final ProductColor black = ProductColor(
    name: "Black",
    colorCode: 0xFF020202,
  );
  static final ProductColor white = ProductColor(
    name: "White",
    colorCode: 0xFFF6F6F6,
  );
  static final ProductColor red = ProductColor(
    name: "Red",
    colorCode: 0xFFB82222,
  );
  static final ProductColor orange = ProductColor(
    name: "Gray",
    colorCode: 0xFFBEA9A9,
  );
  static final ProductColor gray = ProductColor(
    name: "Orange",
    colorCode: 0xFFE2BB8D,
  );
  static final ProductColor blue = ProductColor(
    name: "Blue",
    colorCode: 0xFF151867,
  );

  static List<ProductColor> get values {
    return [black, white, red, orange, gray, blue];
  }
}

class ProductColor {
  final String name;
  late int _colorCode;
  ProductColor({required this.name, required int colorCode}) {
    _colorCode = colorCode;
  }

  Color get color => Color(_colorCode);
}
