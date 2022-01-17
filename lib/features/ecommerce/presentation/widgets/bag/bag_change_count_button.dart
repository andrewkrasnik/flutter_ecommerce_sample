import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BagChangeCountButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData iconData;

  const BagChangeCountButton({Key? key, required this.iconData, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Icon(
            iconData,
            color: Colors.grey,
            size: 24,
          )),
    );
  }
}
