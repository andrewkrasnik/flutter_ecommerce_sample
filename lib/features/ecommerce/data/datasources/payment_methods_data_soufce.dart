import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';

abstract class PaymentMethodsDataStore {
  Future<List<PaymentMethod>> getPaymentMethods();
  Future<void> addPaymentMethods(PaymentMethod paymentMethod);
  Future<PaymentMethod> getDefaultMethod();
  Future<PaymentMethod> setDefaultMethod(PaymentMethod method);
}

class PaymentMethodsDataStoreImpl extends PaymentMethodsDataStore {
  List<PaymentMethod> _list = [];
  PaymentMethodsDataStoreImpl() {
    _list.add(PaymentMethod(
        nameOnCard: "",
        cardType: CardType.MasterCard,
        cardNumber: "5546 8205 3693 3947",
        expireDate: "05/23 ",
        cvv: 567,
        defaultMethod: true));

    _list.add(PaymentMethod(
      nameOnCard: "",
      cardType: CardType.VISA,
      cardNumber: "4203 8205 3693 4546",
      expireDate: "11/22 ",
      cvv: 123,
    ));
  }

  @override
  Future<void> addPaymentMethods(PaymentMethod paymentMethod) async {
    _list.add(paymentMethod);
    return Future.value();
  }

  @override
  Future<PaymentMethod> getDefaultMethod() async {
    return Future.value(_list.firstWhere((element) => element.defaultMethod));
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    return Future.value(_list);
  }

  @override
  Future<PaymentMethod> setDefaultMethod(PaymentMethod method) async {
    for (PaymentMethod paymentMethod in _list) {
      if (paymentMethod.defaultMethod) {
        paymentMethod.defaultMethod = false;
      }
    }
    method.defaultMethod = true;
    return Future.value(method);
  }
}
