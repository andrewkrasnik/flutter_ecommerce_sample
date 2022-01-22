import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/profile_statistic.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/get_profile_statistic.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileStatistic getProfileStatistic;
  ProfileCubit({required this.getProfileStatistic}) : super(ProfileInitial());

  void updateStatistic() async {
    emit(ProfilePageState(statistic: await getProfileStatistic()));
  }
}
