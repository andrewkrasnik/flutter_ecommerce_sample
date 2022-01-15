import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const SearchBarButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.only(bottom: 4),
        onPressed: onPressed,
        child: Icon(
          Icons.search,
          color: Colors.black,
        ));
  }
}
