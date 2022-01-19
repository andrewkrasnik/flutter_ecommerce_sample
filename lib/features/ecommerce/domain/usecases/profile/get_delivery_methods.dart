import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_methods_repository.dart';

class GetDeliveryMethods {
  final DeliveryMethodsRepository repository;

  GetDeliveryMethods(this.repository);

  Future<List<DeliveryMethod>> call() async {
    return await repository.getDeliveryMethods();
  }
}
