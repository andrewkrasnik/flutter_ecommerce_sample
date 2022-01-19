import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_addresses_state.dart';

class DeliveryAddressesCubit extends Cubit<DeliveryAddressesState> {
  DeliveryAddressesCubit() : super(DeliveryAddressesInitial());
}
