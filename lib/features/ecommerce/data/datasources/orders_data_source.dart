import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';

abstract class OrdersDataSource {
  Future<void> addFromBag(Bag bag);
  Future<List<Order>> getOrderList(OrderStatus status);
  Future<int> getOrdersCount();
}

class OrdersDataSourceImpl implements OrdersDataSource {
  static List<Order> _list = [];
  @override
  Future<List<Order>> getOrderList(OrderStatus status) async {
    return Future.value(
        _list.where((element) => element.status == status).toList());
  }

  @override
  Future<void> addFromBag(Bag bag) async {
    _list.add(Order.fromBag(bag));
    return Future.value();
  }

  @override
  Future<int> getOrdersCount() {
    return Future.value(_list.length);
  }
}
