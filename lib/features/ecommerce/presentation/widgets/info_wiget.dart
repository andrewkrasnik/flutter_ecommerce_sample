import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoWiget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const InfoWiget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.1), top: BorderSide(width: 0.1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          CupertinoButton(
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 12,
              ),
              onPressed: onTap)
        ],
      ),
    );
  }
}
