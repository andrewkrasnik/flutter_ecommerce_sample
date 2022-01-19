import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';

class SetDefaultPaymentMethod {
  final PaymentMethodsRepository repository;

  SetDefaultPaymentMethod(this.repository);

  Future<PaymentMethod> call(PaymentMethod method) async {
    return await repository.setDefaultMethod(method);
  }
}
