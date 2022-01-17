import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.only(bottom: 4),
        onPressed: () {
          Navigator.of(context).pushNamed("/search");
        },
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ));
  }
}
