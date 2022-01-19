class DeliveryAddress {
  String fullName;
  String address;
  String city;
  String region;
  String zipCode;
  String country;
  bool defaultAddress;
  DeliveryAddress({
    required this.fullName,
    required this.address,
    required this.city,
    required this.region,
    required this.zipCode,
    required this.country,
    this.defaultAddress = false,
  });
}
