import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/payment_methods_data_soufce.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';

class PaymentMethodsRepositoryImpl extends PaymentMethodsRepository {
  final PaymentMethodsDataStore dataStore;

  PaymentMethodsRepositoryImpl(this.dataStore);

  @override
  Future<void> addPaymentMethods(PaymentMethod paymentMethod) async {
    return await dataStore.addPaymentMethods(paymentMethod);
  }

  @override
  Future<PaymentMethod> getDefaultMethod() async {
    return await dataStore.getDefaultMethod();
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    return await dataStore.getPaymentMethods();
  }

  @override
  Future<PaymentMethod> setDefaultMethod(PaymentMethod method) async {
    return await dataStore.setDefaultMethod(method);
  }
}
