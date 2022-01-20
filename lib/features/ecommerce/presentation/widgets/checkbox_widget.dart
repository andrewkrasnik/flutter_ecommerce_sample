import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  final bool? value;
  final void Function(bool?) onChanged;
  final Color activeColor;
  final Color? color;
  const CheckboxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Material(
        color: color,
        type: MaterialType.card,
        child: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            activeColor: activeColor,
            value: value,
            onChanged: onChanged),
      ),
    );
  }
}
