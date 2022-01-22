import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/add_delivery_adress.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_delivery_adresses.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/set_default_delivery_address.dart';

part 'delivery_addresses_state.dart';

class DeliveryAddressesCubit extends Cubit<DeliveryAddressesState> {
  final GetDeliveryAdresses getDeliveryAdresses;
  final AddDeliveryAdress addDeliveryAdress;
  final SetDefaultDeliveryAdress setDefaultDeliveryAdress;

  DeliveryAddressesCubit({
    required this.getDeliveryAdresses,
    required this.addDeliveryAdress,
    required this.setDefaultDeliveryAdress,
  }) : super(const DeliveryAddressesListState(addresses: []));

  void loadList() async {
    emit(const DeliveryAddressesListState(addresses: []));
    await Future.delayed(const Duration(milliseconds: 500));
    List<DeliveryAddress> list = await getDeliveryAdresses();
    emit(DeliveryAddressesListState(addresses: list));
  }

  void toAddressPage(DeliveryAddress address) async {
    emit(DeliveryAddressPageState(address: address));
  }

  void setDefaultAddress(DeliveryAddress address) async {
    await setDefaultDeliveryAdress(address);
    emit(DeliveryAddressesListState(
      addresses: await getDeliveryAdresses(),
      defaultAddress: address,
    ));
  }
}
