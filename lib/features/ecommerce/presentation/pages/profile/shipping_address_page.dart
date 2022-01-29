import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/text_input_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class ShippingAddressPage extends StatefulWidget {
  late final DeliveryAddress? address;
  final void Function(DeliveryAddress) saveAddress;
  ShippingAddressPage(
      {Key? key, required this.saveAddress, DeliveryAddress? address})
      : super(key: key) {
    this.address = address ?? DeliveryAddress.empty();
  }

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode _address, _city, _region, _zipCode, _country;

  @override
  void initState() {
    super.initState();
    _address = FocusNode();
    _city = FocusNode();
    _region = FocusNode();
    _zipCode = FocusNode();
    _country = FocusNode();
  }

  @override
  void dispose() {
    _address.dispose();
    _city.dispose();
    _region.dispose();
    _zipCode.dispose();
    _country.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeliveryAddress address = widget.address!;
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Adding Shipping Address",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Material(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TetxInputWidget(
                        title: "Full name",
                        text: address.fullName,
                        nextField: _address,
                        onSaved: (value) {
                          address.fullName = value ?? "";
                        },
                      ),
                      TetxInputWidget(
                        title: "Address",
                        text: address.address,
                        currentField: _address,
                        nextField: _city,
                        onSaved: (value) {
                          address.address = value ?? "";
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Address is required";
                          }
                          return null;
                        },
                      ),
                      TetxInputWidget(
                        title: "City",
                        text: address.city,
                        currentField: _city,
                        nextField: _region,
                        onSaved: (value) {
                          address.city = value ?? "";
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "City is required";
                          }
                          return null;
                        },
                      ),
                      TetxInputWidget(
                        title: "State/Province/Region",
                        text: address.region,
                        currentField: _region,
                        nextField: _zipCode,
                        onSaved: (value) {
                          address.region = value ?? "";
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "State/Province/Region is required";
                          }
                          return null;
                        },
                      ),
                      TetxInputWidget(
                        title: "Zip Code(Postal Code)",
                        text: address.zipCode,
                        currentField: _zipCode,
                        nextField: _country,
                        onSaved: (value) {
                          address.zipCode = value ?? "";
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Zip Code is required";
                          }
                          return null;
                        },
                      ),
                      TetxInputWidget(
                        title: "Country",
                        text: address.country,
                        currentField: _country,
                        onSaved: (value) {
                          address.country = value ?? "";
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Country is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RedButton(
                        text: "SAVE ADDRESS",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            widget.saveAddress(address);
                            Navigator.of(context).pop();
                          }
                        },
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
