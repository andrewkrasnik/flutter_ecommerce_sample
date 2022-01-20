import 'package:flutter/cupertino.dart';

class Promocode {
  final String code;
  final String title;
  final double sale;
  final int remaining;
  final Color? color;
  final String? image;

  Promocode({
    required this.code,
    required this.title,
    required this.sale,
    required this.remaining,
    this.color,
    this.image,
  });

  String get presentation => "${sale.toStringAsFixed(0)}%, $title";
}
