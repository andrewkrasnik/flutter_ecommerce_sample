class ProfileStatistic {
  final int ordersCount;
  final int deliveryAddressesCount;
  final String paymentMethod;
  final bool havePromocodes;
  final int reviewCount;
  ProfileStatistic({
    this.ordersCount = 0,
    this.deliveryAddressesCount = 0,
    this.paymentMethod = "****",
    this.havePromocodes = false,
    this.reviewCount = 0,
  });

  String get ordersCountString {
    if (ordersCount == 0) {
      return "Already have no orders";
    } else if (ordersCount == 1) {
      return "Already have one order";
    } else {
      return "Already have $ordersCount orders";
    }
  }

  String get deliveryAddressesCountString {
    if (deliveryAddressesCount == 0) {
      return "No addresses";
    } else if (deliveryAddressesCount == 1) {
      return "One address";
    } else {
      return "$deliveryAddressesCount addresses";
    }
  }

  String get havePromocodesString => havePromocodes
      ? "You have special promocodes"
      : "You have not special promocodes";
  String get reviewCountString {
    if (reviewCount == 0) {
      return "No reviews";
    } else if (reviewCount == 1) {
      return "Reviews for one item";
    } else {
      return "Reviews for $reviewCount items";
    }
  }
}
