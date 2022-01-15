import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';

class AddPaymentsMethod {
  final PaymentMethodsRepository repository;

  AddPaymentsMethod(this.repository);

  Future<void> call(PaymentMethod paymentMethod) async {
    return await repository.addPaymentMethods(paymentMethod);
  }
}
