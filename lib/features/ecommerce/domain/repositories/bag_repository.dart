import 'dart:async';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

abstract class BagRepository {
  Future<Bag> getBag();
  Future<List<Promocode>> getPromocodes();
  Future<List<DeliveryMethod>> getDeliveryMethods();
  Future<void> addToBag(
      {required Product product,
      required ProductSize size,
      required ProductColor color});
  Future<Bag> deleteFromBag(BagItem item);
  Future<Bag> applyPromocode(Promocode promocode);
  Future<Bag> changeItemCount({required BagItem item, required double count});
}
