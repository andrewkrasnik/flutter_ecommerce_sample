import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_addresses_repository.dart';

class GetDeliveryAdresses {
  final DeliveryAddressesRepository repository;

  GetDeliveryAdresses(this.repository);

  Future<List<DeliveryAddress>> call() async {
    return await repository.getDeliveryAddresses();
  }
}
