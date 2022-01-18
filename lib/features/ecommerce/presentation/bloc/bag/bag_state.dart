part of 'bag_bloc.dart';

@immutable
abstract class BagState {}

class BagInitial extends BagState {}

class BagPageState extends BagState {
  final Bag bag;
  final List<Promocode>? promocodeList;

  BagPageState({required this.bag, this.promocodeList});
}
