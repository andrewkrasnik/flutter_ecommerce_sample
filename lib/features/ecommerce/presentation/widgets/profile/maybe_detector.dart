import 'package:flutter/cupertino.dart';

class MaybeDetector extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool isDetector;
  const MaybeDetector(
      {Key? key, required this.child, this.onTap, this.isDetector = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isDetector) {
      return GestureDetector(
        child: child,
        onTap: onTap,
      );
    } else {
      return child;
    }
  }
}
