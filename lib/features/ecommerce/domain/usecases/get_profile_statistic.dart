import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/profile_statistic.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_addresses_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/orders_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/payment_methods_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/promocode_repository.dart';

class GetProfileStatistic {
  final OrdersRepository ordersRepository;
  final DeliveryAddressesRepository deliveryAddressesRepository;
  final PaymentMethodsRepository paymentMethodsRepository;
  final PromocodeRepository promocodeRepository;
  GetProfileStatistic({
    required this.ordersRepository,
    required this.deliveryAddressesRepository,
    required this.paymentMethodsRepository,
    required this.promocodeRepository,
  });

  Future<ProfileStatistic> call() async {
    PaymentMethod paymentMethod =
        await paymentMethodsRepository.getDefaultMethod();

    return ProfileStatistic(
        ordersCount: await ordersRepository.getOrdersCount(),
        deliveryAddressesCount:
            await deliveryAddressesRepository.getAddressesCount(),
        paymentMethod: paymentMethod.presentation,
        havePromocodes: await promocodeRepository.havePromocodes(),
        reviewCount: 4);
  }
}
