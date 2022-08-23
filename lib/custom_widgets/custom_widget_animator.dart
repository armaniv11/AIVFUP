import 'package:flutter/material.dart';

import '../animations/bottomAnimation.dart';

class CustomWidgetAnimator extends StatelessWidget {
  final double height;
  final double width;
  final String imageName;
  const CustomWidgetAnimator(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      child: Container(
        height: height,
        width: width / 3,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                filterQuality: FilterQuality.high,
                image: AssetImage(imageName),
                fit: BoxFit.fill)),
      ),
    ));
  }
}
