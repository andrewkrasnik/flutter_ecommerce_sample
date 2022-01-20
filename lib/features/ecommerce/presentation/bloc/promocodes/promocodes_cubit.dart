import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_promocodes.dart';

part 'promocodes_state.dart';

class PromocodesCubit extends Cubit<PromocodesState> {
  final GetPromocodes getPromocodes;
  PromocodesCubit({required this.getPromocodes}) : super(PromocodesInitial());

  void loadList() async {
    emit(const PromocodesListPageState(list: []));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(PromocodesListPageState(list: await getPromocodes()));
  }
}
