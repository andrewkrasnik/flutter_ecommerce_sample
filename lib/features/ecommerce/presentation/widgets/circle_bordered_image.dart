import 'package:flutter/cupertino.dart';

class CircleBorderedImage extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final Radius? topLeft;
  final Radius? bottomLeft;
  final Radius? bottomRight;
  final Radius? topRight;
  const CircleBorderedImage(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      this.topLeft,
      this.bottomLeft,
      this.bottomRight,
      this.topRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: topLeft ?? Radius.zero,
              bottomLeft: bottomLeft ?? Radius.zero,
              bottomRight: bottomRight ?? Radius.zero,
              topRight: topRight ?? Radius.zero),
          image: DecorationImage(
              image: AssetImage(image),
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth)),
    );
  }
}
