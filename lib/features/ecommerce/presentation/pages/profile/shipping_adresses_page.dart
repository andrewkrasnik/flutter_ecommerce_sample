import 'package:flutter/cupertino.dart';

class ShippingAdressesPage extends StatelessWidget {
  const ShippingAdressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Shipping adresses",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(),
          ),
        ));
  }
}
