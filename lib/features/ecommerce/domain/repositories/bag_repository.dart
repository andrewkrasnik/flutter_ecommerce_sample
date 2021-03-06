import 'dart:async';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';

abstract class BagRepository {
  Future<Bag> getBag();
  Future<void> addToBag(
      {required Product product,
      required ProductSize size,
      required ProductColor color});
  Future<Bag> deleteFromBag(BagItem item);
  Future<Bag> applyPromocode(Promocode? promocode);
  Future<Bag> changeItemCount({required BagItem item, required double count});
}
