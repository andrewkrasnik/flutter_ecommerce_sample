part of 'bag_bloc.dart';

@immutable
abstract class BagState {}

class BagInitial extends BagState {}

class BagPageState extends BagState {
  final Bag bag;

  BagPageState({required this.bag});
}
