import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_addresses_repository.dart';

class GetDefaultDeliveryAdress {
  final DeliveryAddressesRepository repository;

  GetDefaultDeliveryAdress(this.repository);

  Future<DeliveryAddress> call() async {
    return await repository.getDefaultAddress();
  }
}
