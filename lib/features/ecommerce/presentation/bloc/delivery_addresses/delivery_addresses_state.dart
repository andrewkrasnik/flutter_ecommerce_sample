part of 'delivery_addresses_cubit.dart';

abstract class DeliveryAddressesState extends Equatable {
  const DeliveryAddressesState();
}

class DeliveryAddressesListState extends DeliveryAddressesState {
  final List<DeliveryAddress> addresses;
  final DeliveryAddress? defaultAddress;

  const DeliveryAddressesListState(
      {required this.addresses, this.defaultAddress});

  @override
  List<Object?> get props => [addresses, defaultAddress];
}

class DeliveryAddressPageState extends DeliveryAddressesState {
  final DeliveryAddress address;
  const DeliveryAddressPageState({
    required this.address,
  });

  @override
  List<Object?> get props => [address];
}
