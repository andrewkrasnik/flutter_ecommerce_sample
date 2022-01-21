import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_orders.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrders getOrders;
  OrderCubit({required this.getOrders}) : super(OrderInitial());

  void loadList(OrderStatus? status) async {
    emit(OrderListPageState(list: [], status: status));
    await Future.delayed(const Duration(milliseconds: 200));
    emit(OrderListPageState(
        list: await getOrders(status ?? OrderStatuses.processing),
        status: status));
  }

  void toOrderPage(Order order) {
    emit(OrderPageState(order: order, status: order.status));
  }

  void goBack(OrderStatus status) async {
    if (state is OrderPageState) {
      emit(OrderListPageState(list: await getOrders(status), status: status));
    }
  }

  deliver(Order order) {
    order.status = OrderStatuses.delivered;
    emit(OrderPageState(order: order, status: order.status));
  }

  cancell(Order order) {
    order.status = OrderStatuses.cancelled;
    emit(OrderPageState(order: order, status: order.status));
  }
}
