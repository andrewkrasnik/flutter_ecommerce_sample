import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/orders_repository.dart';

class GetOrders {
  final OrdersRepository repository;
  GetOrders(
    this.repository,
  );

  Future<List<Order>> call(OrderStatus status) async {
    return await repository.getOrderList(status);
  }
}
