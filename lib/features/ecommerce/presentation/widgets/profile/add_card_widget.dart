import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/checkbox_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/text_input_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class AddCardWidget extends StatefulWidget {
  late final PaymentMethod method;

  final Future<void> Function(PaymentMethod) addCard;
  final Future<void> Function(PaymentMethod) setDefault;
  AddCardWidget({Key? key, required this.setDefault, required this.addCard})
      : super(key: key) {
    method = PaymentMethod.empty();
  }

  get cvv => null;

  @override
  State<AddCardWidget> createState() => _AddCardWidgetState();
}

class _AddCardWidgetState extends State<AddCardWidget> {
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
        height: 480,
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
            "Add new card",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Material(
            child: Form(
              key: _formKey,
              child: Column(children: [
                TetxInputWidget(
                  title: "Name on card",
                  text: widget.method.nameOnCard,
                  nextField: _cardNumber,
                  onSaved: (value) {
                    widget.method.nameOnCard = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name on card is required";
                    }
                    return null;
                  },
                ),
                TetxInputWidget(
                  title: "Card number",
                  text: widget.method.cardNumber,
                  currentField: _cardNumber,
                  nextField: _expireDate,
                  onSaved: (value) {
                    widget.method.cardNumber = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Card number is required";
                    }
                    return null;
                  },
                ),
                TetxInputWidget(
                  title: "Expire Date",
                  text: widget.method.expireDate,
                  currentField: _expireDate,
                  nextField: _cvv,
                  onSaved: (value) {
                    widget.method.expireDate = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Expire Date is required";
                    }
                    return null;
                  },
                ),
                TetxInputWidget(
                  title: "CVV",
                  text: widget.method.cvv == 0
                      ? ""
                      : widget.method.cvv.toString(),
                  currentField: _cvv,
                  keyboardType: TextInputType.number,
                  length: 3,
                  onSaved: (value) {
                    widget.method.cvv = int.parse(value ?? "0");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "CVV is required";
                    }
                    return null;
                  },
                ),
                Row(children: [
                  CheckboxWidget(
                    value: widget.method.defaultMethod,
                    onChanged: (value) {
                      // BlocProvider.of<PaymentMethodsCubit>(context)
                      //     .setDefaultMethod(widget.method);
                      setState(() {
                        widget.method.defaultMethod = value ?? false;
                      });
                    },
                    activeColor: AppColors.black,
                    color: AppColors.white,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Text("Use as default payment method"),
                ]),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RedButton(
                    text: "ADD CARD",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await widget.addCard(widget.method);
                        if (widget.method.defaultMethod) {
                          await widget.setDefault(widget.method);
                        }
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
