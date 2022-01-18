part of 'bag_bloc.dart';

@immutable
abstract class BagEvent {}

class BagInitListEvent extends BagEvent {}

class BagItemChangeCountEvent extends BagEvent {
  final BagItem item;
  final double count;
  BagItemChangeCountEvent({required this.item, required this.count});
}

class BagItemDeleteEvent extends BagEvent {
  final BagItem item;

  BagItemDeleteEvent({required this.item});
}

class BagItemToFavoritesEvent extends BagEvent {
  final BagItem item;
  BagItemToFavoritesEvent({required this.item});
}

class BagPromocodeToSelectEvent extends BagEvent {}

class BagPromocodeSearchEvent extends BagEvent {
  final String code;
  BagPromocodeSearchEvent({
    required this.code,
  });
}

class BagPromocodeApplyEvent extends BagEvent {
  final Promocode? promocode;
  BagPromocodeApplyEvent({
    this.promocode,
  });
}

class BagShippingAdressChangeEvent extends BagEvent {}

class BagShippingAdressApplyEvent extends BagEvent {}

class BagPaymentMethodChangeEvent extends BagEvent {}

class BagPaymentMethodApplyEvent extends BagEvent {}

class BagCheckOutTapEvent extends BagEvent {}

class BagSubmitOrderTapEvent extends BagEvent {}

class BagContinueShoppintTapEvent extends BagEvent {}
