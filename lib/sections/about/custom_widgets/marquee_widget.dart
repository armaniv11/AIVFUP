import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marquee/marquee.dart';

class MarqueeWidget extends StatelessWidget {
  final double height;
  final double width;
  const MarqueeWidget({Key? key, this.height = 50, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[800],
        borderRadius: BorderRadius.circular(8),
      ),
      height: height,
      width: width,
      child: Marquee(
        text:
            'आगामी 24 जुलाई दिन रविवार को अखिल भारतीय वैश्य महासम्मेलन उत्तर प्रदेश की प्रदेश कार्यकारिणी की बैठक अग्रवाल कालेज, मोतीनगर, ऎशबाग लखनऊ में प्रातः 10 बजे से आहूत की गयी है|',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 20.0,
        velocity: 50.0,
        pauseAfterRound: Duration(seconds: 1),
        startPadding: 30.0,
        fadingEdgeEndFraction: 0.3,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.easeIn,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
