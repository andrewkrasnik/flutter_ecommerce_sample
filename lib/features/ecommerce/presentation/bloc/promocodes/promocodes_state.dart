part of 'promocodes_cubit.dart';

abstract class PromocodesState extends Equatable {
  const PromocodesState();

  @override
  List<Object> get props => [];
}

class PromocodesInitial extends PromocodesState {}

class PromocodesListPageState extends PromocodesState {
  final List<Promocode> list;
  const PromocodesListPageState({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}
