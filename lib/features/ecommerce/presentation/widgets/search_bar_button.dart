import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoButton(
        padding: EdgeInsets.only(bottom: 4),
        onPressed: null,
        child: Icon(
          Icons.search,
          color: Colors.black,
        ));
  }
}
