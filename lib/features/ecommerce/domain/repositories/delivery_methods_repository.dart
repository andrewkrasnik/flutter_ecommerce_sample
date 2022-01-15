import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';

abstract class DeliveryMethodsRepository {
  Future<List<DeliveryMethod>> getDeliveryMethods();
}
