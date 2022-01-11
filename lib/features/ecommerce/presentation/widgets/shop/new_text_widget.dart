import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTextWidget extends StatelessWidget {
  const NewTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: const Center(
        child: Text(
          "NEW",
          style: TextStyle(
              fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
