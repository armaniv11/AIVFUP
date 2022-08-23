import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../widget/adaptiveText.dart';

class NationalCommiteeTile extends StatelessWidget {
  final String image, name, post, info;
  final double height;
  final double width;
  const NationalCommiteeTile(
      {Key? key,
      required this.image,
      required this.name,
      required this.post,
      required this.info,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: height / 2,
              width: width / 4.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/$image'), fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            width: 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdaptiveText(
                  name,
                  style: GoogleFonts.montserrat(
                      color: Colors.red[800],
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold),
                ),
                AdaptiveText(
                  post,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  child: Divider(
                    color: Colors.deepOrange,
                    height: 30,
                    thickness: 6,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AdaptiveText(
                  info,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
