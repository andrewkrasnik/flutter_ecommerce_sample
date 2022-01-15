import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_adress.dart';

abstract class DeliveryAdressesRepository {
  Future<List<DeliveryAdress>> getDeliveryAdresses();
  Future<void> addDeliveryAdress(DeliveryAdress adress);
}
