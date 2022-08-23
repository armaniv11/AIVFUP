import 'package:flutter/material.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageWithDetail extends StatelessWidget {
  final String img;
  final double height;
  final double width;
  final String name;
  final String post;
  final String mob;
  final String email;
  final bool isMobile;
  const ImageWithDetail(
      {Key? key,
      required this.img,
      required this.height,
      required this.width,
      required this.name,
      required this.post,
      required this.mob,
      required this.email,
      this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: isMobile
              ? EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8)
              : EdgeInsets.only(right: 40, left: 40, bottom: 40, top: 40),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: size.height * height,
              width: isMobile ? double.maxFinite : size.width / width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // border: Border.all(),
                  image: DecorationImage(
                      image: AssetImage('assets/$img'), fit: BoxFit.fill)),
            ),
          ),
        ),
        AdaptiveText(
          name,
          style: GoogleFonts.montserrat(
              fontSize: size.height * 0.045,
              fontWeight: FontWeight.w800,
              color: Colors.deepOrange),
        ),
        AdaptiveText(
          post,
          style: GoogleFonts.montserrat(
              fontSize: size.height * 0.030,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
        // Container(
        //   width: 200,
        //   decoration: BoxDecoration(
        //     border: Border(
        //       bottom: BorderSide(color: Colors.grey[800]!, width: 2.0),
        //     ),
        //   ),
        // ),

        AdaptiveText(
          mob,
          style: GoogleFonts.montserrat(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w400,
              color: Colors.blue[800]),
        ),
        // AdaptiveText(
        //   email,
        //   style: GoogleFonts.montserrat(
        //       fontSize: size.height * 0.025,
        //       fontWeight: FontWeight.w400,
        //       color: Colors.blue[800]),
        // ),
        // SizedBox(
        //   height: 200,
        // ),
      ],
    );
  }
}
