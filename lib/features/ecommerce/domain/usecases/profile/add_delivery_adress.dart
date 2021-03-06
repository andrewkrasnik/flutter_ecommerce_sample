import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_addresses_repository.dart';

class AddDeliveryAdress {
  final DeliveryAddressesRepository repository;

  AddDeliveryAdress(this.repository);

  Future<void> call(DeliveryAddress adress) async {
    return await repository.addDeliveryAddress(adress);
  }
}
