import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'promocodes_state.dart';

class PromocodesCubit extends Cubit<PromocodesState> {
  PromocodesCubit() : super(PromocodesInitial());
}
