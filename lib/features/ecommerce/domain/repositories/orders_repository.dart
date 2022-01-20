import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';

abstract class OrdersRepository {
  Future<void> addFromBag(Bag bag);
  Future<List<Order>> getOrderList(OrderStatus status);
}
