import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/delivery_adresses_data_store.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_addresses_repository.dart';

class DeliveryAddressesRepositoryImpl implements DeliveryAddressesRepository {
  final DeliveryAddressesDataStore dataStore;

  DeliveryAddressesRepositoryImpl(this.dataStore);

  @override
  Future<void> addDeliveryAddress(DeliveryAddress adress) async {
    return await dataStore.addDeliveryAddress(adress);
  }

  @override
  Future<List<DeliveryAddress>> getDeliveryAddresses() async {
    return await dataStore.getDeliveryAddresses();
  }

  @override
  Future<DeliveryAddress> getDefaultAddress() async {
    return await dataStore.getDefaultAddress();
  }

  @override
  Future<DeliveryAddress> setDefaultAddress(DeliveryAddress address) async {
    return await dataStore.setDefaultAddress(address);
  }

  @override
  Future<int> getAddressesCount() async {
    return await dataStore.getAddressesCount();
  }
}
