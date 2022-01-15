import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_adress.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_adresses_repository.dart';

class GetDeliveryAdresses {
  final DeliveryAdressesRepository repository;

  GetDeliveryAdresses(this.repository);

  Future<List<DeliveryAdress>> call() async {
    return await repository.getDeliveryAdresses();
  }
}
