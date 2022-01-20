part of 'delivery_addresses_cubit.dart';

abstract class DeliveryAddressesState {
  const DeliveryAddressesState();
}

class DeliveryAddressesListState extends DeliveryAddressesState {
  final List<DeliveryAddress> addresses;

  const DeliveryAddressesListState({
    required this.addresses,
  });
}

class DeliveryAddressPageState extends DeliveryAddressesState {
  final DeliveryAddress address;
  const DeliveryAddressPageState({
    required this.address,
  });
}
