import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/add_payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_default_payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_payment_methods.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/set_default_payment_method.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  final GetPaymentMethods getPaymentMethods;
  final GetDefaultPaymentMethod getDefaultPaymentMethod;
  final SetDefaultPaymentMethod setDefaultPaymentMethod;
  final AddPaymentsMethod addPaymentsMethod;
  PaymentMethodsCubit({
    required this.getPaymentMethods,
    required this.getDefaultPaymentMethod,
    required this.setDefaultPaymentMethod,
    required this.addPaymentsMethod,
  }) : super(const PaymentMethodsListState(methods: []));

  void loadList() async {
    emit(const PaymentMethodsListState(methods: []));
    await Future.delayed(const Duration(milliseconds: 500));

    emit(PaymentMethodsListState(
        methods: await getPaymentMethods(),
        defaultMethod: await getDefaultPaymentMethod()));
  }

  Future<void> setDefaultMethod(PaymentMethod method) async {
    await setDefaultPaymentMethod(method);
    emit(PaymentMethodsListState(
        methods: await getPaymentMethods(), defaultMethod: method));
  }

  Future<void> addCard(PaymentMethod method) async {
    await addPaymentsMethod(method);
    loadList();
  }
}
