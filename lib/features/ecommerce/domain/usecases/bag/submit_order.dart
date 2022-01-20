import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_methods_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/orders_repository.dart';

class SubmitOrder {
  BagRepository bagRepository;
  OrdersRepository ordersRepository;
  DeliveryMethodsRepository deliveryMethodsRepository;
  SubmitOrder({
    required this.bagRepository,
    required this.ordersRepository,
    required this.deliveryMethodsRepository,
  });

  Future<void> call() async {
    Bag bag = await bagRepository.getBag();
    List<DeliveryMethod> deliveryMethods =
        await deliveryMethodsRepository.getDeliveryMethods();
    bag.deliveryMethod = deliveryMethods[0];
    await ordersRepository.addFromBag(bag);
    bag.clear();
    return Future.value();
  }
}
