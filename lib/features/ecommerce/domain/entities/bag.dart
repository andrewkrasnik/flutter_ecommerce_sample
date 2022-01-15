import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_adress.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

class Bag {
  double _totalSum = 0;
  double _itemsSum = 0;
  double _deliverySum = 0;
  List<BagItem> _items = [];
  Promocode? _promocode;
  DeliveryAdress? deliveryAdress;
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
    return sum;
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

class Promocode {}