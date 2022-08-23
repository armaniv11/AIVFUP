import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarLogo extends StatelessWidget {
  final double? height;
  NavBarLogo({this.height});
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 20.0, 0.0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              "assets/aivflogo.png",
            ),
          ),
          // Text(
          //   "< ",
          //   style: TextStyle(
          //     fontSize: height ?? 20,
          //     color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          //   ),flu
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("All India Vaish Federation U.P.",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))),
          ),
          // Text(
          //   MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          //   style: TextStyle(
          //     fontSize: height ?? 20,
          //     color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}

class NavBarLogoMobile extends StatelessWidget {
  final double? height;
  NavBarLogoMobile({this.height});
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 0.0, 20.0, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              "assets/aivflogo.png",
            ),
          ),
          // Text(
          //   "< ",
          //   style: TextStyle(
          //     fontSize: height ?? 20,
          //     color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          //   ),flu
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("All India Vaish Federation U.P.",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))),
          ),
          // Text(
          //   MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          //   style: TextStyle(
          //     fontSize: height ?? 20,
          //     color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}
