import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';

abstract class DeliveryMethodsDataSource {
  Future<List<DeliveryMethod>> getDeliveryMethods();
}

class DeliveryMethodsDataSourceImpl implements DeliveryMethodsDataSource {
  @override
  Future<List<DeliveryMethod>> getDeliveryMethods() {
    // TODO: implement getDeliveryMethods
    throw UnimplementedError();
  }
}
