import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';

abstract class DeliveryMethodsDataSource {
  Future<List<DeliveryMethod>> getDeliveryMethods();
}

class DeliveryMethodsDataSourceImpl implements DeliveryMethodsDataSource {
  List<DeliveryMethod> _list = [];
  DeliveryMethodsDataSourceImpl() {
    _list.add(DeliveryMethod(
        name: "FedEx",
        logo: "assets/images/bag/fedex.png",
        deliveryPeriod: "2-3 days"));

    _list.add(DeliveryMethod(
        name: "USPS",
        logo: "assets/images/bag/usps.png",
        deliveryPeriod: "2-3 days"));

    _list.add(DeliveryMethod(
        name: "DHL",
        logo: "assets/images/bag/dhl.png",
        deliveryPeriod: "2-3 days"));
  }
  @override
  Future<List<DeliveryMethod>> getDeliveryMethods() async {
    return Future.value(_list);
  }
}
