import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

import 'promocode.dart';

class Bag {
  double _deliverySum = 15;
  List<BagItem> _items = [];
  Promocode? _promocode;
  DeliveryAddress? deliveryAddress;
  PaymentMethod? paymentMethod;
  DeliveryMethod? deliveryMethod;

  double get totalSum {
    return _deliverySum + itemsSum;
  }

  double get itemsSum {
    double sum = 0;
    for (BagItem bagItem in _items) {
      sum += bagItem._sum;
    }
    double sale = _promocode == null ? 0 : _promocode!.sale;
    return sum * (100 - sale) / 100;
  }

  BagItem getItem(int index) => _items[index];

  int get itemCount => _items.length;

  double get deliverySum => _deliverySum;

  void addItem(BagItem item) {
    _items.add(item);
  }

  void deleteItem(BagItem item) {
    _items.remove(item);
  }

  void applyPromocode(Promocode? promocode) {
    _promocode = promocode;
  }

  Promocode? get promocode => _promocode;

  void clear() async {
    _items.clear();
    _promocode = null;
  }
}

class BagItem {
  final Product product;
  final ProductSize size;
  final ProductColor color;
  double _count = 0;
  double _sum = 0;
  BagItem({
    required this.product,
    required this.size,
    required this.color,
    double count = 1.0,
  }) {
    if (count > 0) {
      _count = count;
      _sum = _count * product.realPrice;
    }
  }

  double get sum => _sum;
  double get count => _count;

  set count(double count) {
    if (count > 0) {
      _count = count;
      _sum = _count * product.realPrice;
    }
  }
}
