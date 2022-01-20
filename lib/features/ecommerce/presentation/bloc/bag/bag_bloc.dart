import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/apply_promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/change_item_count.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/delete_from_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/get_bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/submit_order.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_default_delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_default_payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_delivery_methods.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/profile/get_promocodes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/usecases/bag/search_promocode.dart';
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
  final GetPromocodes getPromocodes;
  final ApplyPromocode applyPromocode;
  final SearchPromocode searchPromocode;
  final GetDefaultDeliveryAdress getDefaultDeliveryAdress;
  final GetDefaultPaymentMethod getDefaultPaymentMethod;
  final SubmitOrder submitOrder;

  BagBloc({
    required this.getBag,
    required this.deleteFromBag,
    required this.changeItemCount,
    required this.getDeliveryMethods,
    required this.addFavorite,
    required this.getPromocodes,
    required this.applyPromocode,
    required this.searchPromocode,
    required this.getDefaultDeliveryAdress,
    required this.getDefaultPaymentMethod,
    required this.submitOrder,
  }) : super(BagInitial()) {
    on<BagInitListEvent>((event, emit) async {
      emit(BagPageState(
        bag: await getBag(),
        promocodeList: await getPromocodes(),
      ));
    });

    on<BagItemChangeCountEvent>((event, emit) async {
      emit(BagPageState(
        bag: await changeItemCount(item: event.item, count: event.count),
      ));
    });

    on<BagItemToFavoritesEvent>(((event, emit) async {
      await deleteFromBag(event.item);
      await addFavorite(
          product: event.item.product,
          size: event.item.size,
          color: event.item.color);
      emit(BagPageState(
        bag: await getBag(),
      ));
    }));

    on<BagItemDeleteEvent>(((event, emit) async {
      await deleteFromBag(event.item);
      emit(BagPageState(
        bag: await getBag(),
      ));
    }));

    on<BagPromocodeToSelectEvent>((event, emit) async {
      emit(BagPageState(
        bag: await getBag(),
        promocodeList: await getPromocodes(),
      ));
    });

    on<BagPromocodeSearchEvent>((event, emit) async {
      emit(BagPageState(
        bag: await searchPromocode(event.code),
      ));
    });

    on<BagPromocodeApplyEvent>((event, emit) async {
      emit(BagPageState(
        bag: await applyPromocode(event.promocode),
      ));
    });

    on<BagShippingAdressChangeEvent>((event, emit) async {
      Bag bag = await getBag();
      bag.deliveryAddress = event.address;
      emit(BagCheckoutState(
          bag: bag, deliveryMethods: await getDeliveryMethods()));
    });
    on<BagBackFromChechOut>((event, emit) async {
      emit(BagPageState(
        bag: await getBag(),
        promocodeList: await getPromocodes(),
      ));
    });
    on<BagPaymentMethodChangeEvent>((event, emit) async {
      Bag bag = await getBag();
      bag.paymentMethod = event.method;
      emit(BagCheckoutState(
          bag: bag, deliveryMethods: await getDeliveryMethods()));
    });
    on<BagPaymentMethodApplyEvent>((event, emit) async {});
    on<BagCheckOutTapEvent>((event, emit) async {
      Bag bag = await getBag();
      bag.deliveryAddress = await getDefaultDeliveryAdress();
      bag.paymentMethod = await getDefaultPaymentMethod();
      emit(BagCheckoutState(
          bag: bag, deliveryMethods: await getDeliveryMethods()));
    });
    on<BagSubmitOrderTapEvent>((event, emit) async {
      await submitOrder();
      emit(BagSuccessState());
    });
    on<BagContinueShoppintTapEvent>((event, emit) async {});
  }
}
