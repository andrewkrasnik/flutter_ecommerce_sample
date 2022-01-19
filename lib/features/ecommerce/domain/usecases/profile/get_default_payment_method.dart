import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';

class GetDefaultPaymentMethod {
  final PaymentMethodsRepository repository;

  GetDefaultPaymentMethod(this.repository);

  Future<PaymentMethod> call() async {
    return await repository.getDefaultMethod();
  }
}
