class DeliveryMethod {
  final String name;
  final String logo;
  final String deliveryPeriod;
  final double price = 15;
  DeliveryMethod({
    required this.name,
    required this.logo,
    required this.deliveryPeriod,
  });

  String get presentation =>
      "$name, $deliveryPeriod, ${price.toStringAsFixed(0)}\$";
}
