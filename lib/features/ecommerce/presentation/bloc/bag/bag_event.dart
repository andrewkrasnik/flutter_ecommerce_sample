part of 'bag_bloc.dart';

@immutable
abstract class BagEvent {}

class BagInitListEvent extends BagEvent {}

class BagChangeItemCountEvent extends BagEvent {
  final BagItem item;
  final double count;
  BagChangeItemCountEvent({required this.item, required this.count});
}
