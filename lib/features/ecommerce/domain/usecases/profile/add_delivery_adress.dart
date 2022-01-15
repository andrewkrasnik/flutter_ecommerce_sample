import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_adress.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_adresses_repository.dart';

class AddDeliveryAdress {
  final DeliveryAdressesRepository repository;

  AddDeliveryAdress(this.repository);

  Future<void> call(DeliveryAdress adress) async {
    return await repository.addDeliveryAdress(adress);
  }
}
