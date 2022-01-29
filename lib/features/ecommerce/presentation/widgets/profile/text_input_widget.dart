import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class TetxInputWidget extends StatelessWidget {
  final String title;
  final String text;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final FocusNode? nextField;
  final FocusNode? currentField;
  final TextInputType? keyboardType;
  final int? length;
  TetxInputWidget({
    Key? key,
    required this.title,
    required this.text,
    this.onSaved,
    this.validator,
    this.nextField,
    this.currentField,
    this.keyboardType,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: TextFormField(
        initialValue: text,
        focusNode: currentField,
        keyboardType: keyboardType,
        maxLength: length,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                )),
            contentPadding:
                const EdgeInsets.only(left: 20, top: 14, bottom: 14),
            // hintText: title,
            // hintStyle: const TextStyle(color: AppColors.grayText),
            labelText: title,
            alignLabelWithHint: true,
            helperText: "",
            labelStyle:
                const TextStyle(color: AppColors.grayText, fontSize: 11),
            filled: true,
            fillColor: AppColors.white),
        onSaved: onSaved,
        validator: validator,
        onEditingComplete: () {
          nextField == null
              ? FocusScope.of(context).requestFocus(FocusNode())
              : nextField!.requestFocus();
        },
      ),
    );
  }
}
