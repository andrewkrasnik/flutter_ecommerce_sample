import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';

abstract class DeliveryAddressesRepository {
  Future<List<DeliveryAddress>> getDeliveryAddresses();
  Future<void> addDeliveryAddress(DeliveryAddress adress);
  Future<DeliveryAddress> getDefaultAddress();
  Future<DeliveryAddress> setDefaultAddress(DeliveryAddress address);
  Future<int> getAddressesCount();
}
