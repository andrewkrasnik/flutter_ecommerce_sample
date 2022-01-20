part of '../order/order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderListPageState extends OrderState {
  final List<Order> list;
  OrderStatus? status;
  OrderListPageState({
    required this.list,
    this.status,
  }) {
    status ??= OrderStatuses.processing;
  }

  @override
  List<Object> get props => [list, status ?? OrderStatuses.processing];
}

class OrderPageState extends OrderState {
  final Order order;

  const OrderPageState(this.order);

  @override
  List<Object> get props => [order];
}
