import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';

class GetPaymentMethods {
  final PaymentMethodsRepository repository;

  GetPaymentMethods(this.repository);

  Future<List<PaymentMethod>> call() async {
    return await repository.getPaymentMethods();
  }
}
