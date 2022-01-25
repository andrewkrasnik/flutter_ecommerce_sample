import 'package:flutter/cupertino.dart';

class SettingsSwitchRow extends StatelessWidget {
  final String title;
  final bool value;
  void Function(bool)? onChanged;
  SettingsSwitchRow(
      {Key? key, required this.title, required this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Semantics(
            container: true,
            label: "",
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ]);
  }
}
