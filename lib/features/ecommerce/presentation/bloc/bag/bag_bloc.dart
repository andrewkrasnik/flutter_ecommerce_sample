import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/change_item_count.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/delete_from_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/get_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/get_delivery_methods.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/favorites/add_favorite.dart';
import 'package:meta/meta.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  final GetBag getBag;
  final DeleteFromBag deleteFromBag;
  final ChangeItemCount changeItemCount;
  final GetDeliveryMethods getDeliveryMethods;
  final AddFavorite addFavorite;

  BagBloc({
    required this.getBag,
    required this.deleteFromBag,
    required this.changeItemCount,
    required this.getDeliveryMethods,
    required this.addFavorite,
  }) : super(BagInitial()) {
    on<BagInitListEvent>((event, emit) async {
      emit(BagPageState(bag: Bag()));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(BagPageState(bag: await getBag()));
    });
    on<BagChangeItemCountEvent>((event, emit) async {
      emit(BagPageState(
          bag: await changeItemCount(item: event.item, count: event.count)));
    });
  }
}
