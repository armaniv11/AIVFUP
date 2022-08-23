import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.45,
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/mainbanner.jpg',
                height: height * 0.45,
                width: width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.9),
                  Colors.white,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
