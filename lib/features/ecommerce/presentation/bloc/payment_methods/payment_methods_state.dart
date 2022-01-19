part of 'payment_methods_cubit.dart';

abstract class PaymentMethodsState extends Equatable {
  const PaymentMethodsState();

  @override
  List<Object> get props => [];
}

class PaymentMethodsInitial extends PaymentMethodsState {}
