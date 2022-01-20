import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/orders_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersDataSource dataSource;
  OrdersRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<void> addFromBag(Bag bag) async {
    return await dataSource.addFromBag(bag);
  }

  @override
  Future<List<Order>> getOrderList(OrderStatus status) async {
    return await dataSource.getOrderList(status);
  }
}
