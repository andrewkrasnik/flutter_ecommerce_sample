import 'package:equatable/equatable.dart';

class DeliveryAddress extends Equatable {
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

  factory DeliveryAddress.empty() {
    return DeliveryAddress(
        fullName: "",
        address: "",
        city: "",
        region: "",
        zipCode: "",
        country: "");
  }
  String get presentation => "$address, $city, $region $zipCode, $country";

  @override
  List<Object?> get props =>
      [defaultAddress, fullName, address, city, region, zipCode, country];
}
