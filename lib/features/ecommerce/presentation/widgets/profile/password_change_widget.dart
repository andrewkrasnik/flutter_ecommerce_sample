import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/checkbox_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/text_input_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class PasswordChangeWidget extends StatefulWidget {
  late final PaymentMethod method;

  // final Future<void> Function(PaymentMethod)? addCard;
  // final Future<void> Function(PaymentMethod)? setDefault;
  PasswordChangeWidget({
    Key? key,
  }) : super(key: key) {
    method = PaymentMethod.empty();
  }

  get cvv => null;

  @override
  State<PasswordChangeWidget> createState() => _PasswordChangeWidgetState();
}

class _PasswordChangeWidgetState extends State<PasswordChangeWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode _cardNumber, _expireDate, _cvv;

  @override
  void initState() {
    super.initState();
    _cardNumber = FocusNode();
    _expireDate = FocusNode();
    _cvv = FocusNode();
  }

  @override
  void dispose() {
    _cardNumber.dispose();
    _expireDate.dispose();
    _cvv.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 10) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: 400,
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 60,
            height: 6,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(5)),
          ),
          const Text(
            "Password Change",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            child: Form(
              key: _formKey,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TetxInputWidget(
                  title: "Old Password",
                  text: "",
                  nextField: _cardNumber,
                  onSaved: (value) {
                    widget.method.nameOnCard = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Old Password is required";
                    }
                    return null;
                  },
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(color: AppColors.grayText),
                ),
                const SizedBox(
                  height: 18,
                ),
                TetxInputWidget(
                  title: "New Password",
                  text: widget.method.cardNumber,
                  currentField: _cardNumber,
                  nextField: _expireDate,
                  onSaved: (value) {
                    widget.method.cardNumber = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "New Password is required";
                    }
                    return null;
                  },
                ),
                TetxInputWidget(
                  title: "Repeat New Password",
                  text: widget.method.expireDate,
                  currentField: _expireDate,
                  nextField: _cvv,
                  onSaved: (value) {
                    widget.method.expireDate = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Repeat New Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RedButton(
                    text: "SAVE PASSWORD",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
