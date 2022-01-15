import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';

class GetPaymentsMethods {
  final PaymentMethodsRepository repository;

  GetPaymentsMethods(this.repository);

  Future<List<PaymentMethod>> call() async {
    return await repository.getPaymentMethods();
  }
}
