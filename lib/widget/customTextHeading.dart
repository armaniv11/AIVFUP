import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;
  final bool isMobile;

  const CustomSectionHeading(
      {Key? key, required this.text, this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveText(
      text,
      style: GoogleFonts.montserrat(
        fontSize: isMobile ? 20 : MediaQuery.of(context).size.height * 0.075,
        fontWeight: isMobile ? FontWeight.w400 : FontWeight.w100,
        // letterSpacing: 1.0,
        color: Colors.black,
      ),
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return AdaptiveText(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w200,
        color: _themeProvider.lightTheme ? Colors.black : Colors.white,
      ),
    );
  }
}
