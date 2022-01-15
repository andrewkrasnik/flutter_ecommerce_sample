import 'package:flutter/cupertino.dart';

class PaymentsMethodsPage extends StatelessWidget {
  const PaymentsMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Payments methods",
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
