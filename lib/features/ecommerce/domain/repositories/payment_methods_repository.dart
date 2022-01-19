import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';

abstract class PaymentMethodsRepository {
  Future<List<PaymentMethod>> getPaymentMethods();
  Future<void> addPaymentMethods(PaymentMethod paymentMethod);
  Future<PaymentMethod> getDefaultMethod();
  Future<PaymentMethod> setDefaultMethod(PaymentMethod method);
}
