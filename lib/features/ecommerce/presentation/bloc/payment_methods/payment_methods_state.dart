part of 'payment_methods_cubit.dart';

abstract class PaymentMethodsState extends Equatable {
  const PaymentMethodsState();

  @override
  List<Object> get props => [];
}

class PaymentMethodsListState extends PaymentMethodsState {
  final List<PaymentMethod> methods;
  final PaymentMethod? defaultMethod;

  const PaymentMethodsListState({
    required this.methods,
    this.defaultMethod,
  });

  @override
  List<Object> get props =>
      [methods, defaultMethod ?? ""]; //непонятно можно ли так делать
}

class PaymentMethodsPageState extends PaymentMethodsState {
  final PaymentMethod method;
  const PaymentMethodsPageState({
    required this.method,
  });

  @override
  List<Object> get props => [method];
}
