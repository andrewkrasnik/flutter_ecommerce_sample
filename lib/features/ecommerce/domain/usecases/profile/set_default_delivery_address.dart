import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_addresses_repository.dart';

class SetDefaultDeliveryAdress {
  final DeliveryAddressesRepository repository;

  SetDefaultDeliveryAdress(this.repository);

  Future<DeliveryAddress> call(DeliveryAddress address) async {
    return await repository.setDefaultAddress(address);
  }
}
