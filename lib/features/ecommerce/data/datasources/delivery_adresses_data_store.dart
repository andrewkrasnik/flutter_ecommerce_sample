import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';

abstract class DeliveryAddressesDataStore {
  Future<List<DeliveryAddress>> getDeliveryAddresses();
  Future<void> addDeliveryAddress(DeliveryAddress adress);
  Future<DeliveryAddress> getDefaultAddress();
  Future<DeliveryAddress> setDefaultAddress(DeliveryAddress address);
}

class DeliveryAddressesDataStoreImpl implements DeliveryAddressesDataStore {
  List<DeliveryAddress> _list = [];
  DeliveryAddressesDataStoreImpl() {
    _list.add(DeliveryAddress(
      fullName: "Jane Doe",
      address: "3 Newbridge Court",
      city: "Chino Hills",
      region: "California",
      zipCode: "91709",
      country: "Unated States",
      defaultAddress: true,
    ));

    _list.add(DeliveryAddress(
      fullName: "Jane Doe",
      address: "3 Newbridge Court",
      city: "Chino Hills",
      region: "California",
      zipCode: "91709",
      country: "Unated States",
    ));

    _list.add(DeliveryAddress(
      fullName: "Jane Doe",
      address: "51 Riverside",
      city: "Chino Hills",
      region: "California",
      zipCode: "91709",
      country: "Unated States",
    ));
  }
  @override
  Future<void> addDeliveryAddress(DeliveryAddress address) async {
    _list.add(address);
    return Future.value();
  }

  @override
  Future<DeliveryAddress> getDefaultAddress() async {
    return Future.value(_list.firstWhere((element) => element.defaultAddress));
  }

  @override
  Future<List<DeliveryAddress>> getDeliveryAddresses() async {
    return Future.value(_list);
  }

  @override
  Future<DeliveryAddress> setDefaultAddress(DeliveryAddress address) async {
    for (DeliveryAddress deliveryAddress in _list) {
      if (deliveryAddress.defaultAddress) {
        deliveryAddress.defaultAddress = false;
      }
    }
    address.defaultAddress = true;
    return Future.value(address);
  }
}
