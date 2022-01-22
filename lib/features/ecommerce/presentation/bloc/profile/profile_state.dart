part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfilePageState extends ProfileState {
  final ProfileStatistic statistic;
  const ProfilePageState({
    required this.statistic,
  });
  @override
  List<Object> get props => [statistic];
}
