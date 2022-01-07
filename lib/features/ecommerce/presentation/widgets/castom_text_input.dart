import 'package:flutter/cupertino.dart';

class CastomTextInput extends StatelessWidget {
  final String placeholder;
  const CastomTextInput({Key? key, required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CupertinoTextField(
        suffix: const Icon(
          CupertinoIcons.check_mark,
          color: Color(0xFF2AA952),
        ),
        suffixMode: OverlayVisibilityMode.notEditing,
        padding: const EdgeInsets.all(20),
        placeholder: placeholder,
        placeholderStyle:
            const TextStyle(fontSize: 14, color: Color(0xFF9B9B9B)),
      ),
    );
  }
}
