import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeDesktop extends StatefulWidget {
  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];

  final List<String> images = [
    'assets/mainbanner.jpg',
    'assets/agrohadham.jpg'
  ];

  bool _isPlaying = false;

  CarouselSliderController? _sliderController;
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.9,
      width: width,
      child: Stack(
        children: [
          // Container(
          //   height: height * 0.9,
          //   width: width,
          //   child: CarouselSlider.builder(
          //     unlimitedMode: true,
          //     controller: _sliderController,
          //     slideBuilder: (index) {
          //       return Container(
          //           height: height * 0.9,
          //           width: width,
          //           alignment: Alignment.center,
          //           // color: colors[index],
          //           child: Image.asset(
          //             images[index],
          //             fit: BoxFit.contain,
          //           ));
          //     },
          //     // slideTransform: CubeTransform(),
          //     slideIndicator: CircularSlideIndicator(
          //       // padding: EdgeInsets.only(bottom: 32),
          //       indicatorBorderColor: Colors.black,
          //     ),
          //     itemCount: images.length,
          //     initialPage: 0,
          //     enableAutoSlider: true,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 32),
          //   child: Align(
          //     child: ConstrainedBox(
          //       constraints: BoxConstraints(minWidth: 240, maxWidth: 600),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           IconButton(
          //             iconSize: 48,
          //             icon: Icon(Icons.skip_previous),
          //             onPressed: () {
          //               _sliderController?.previousPage();
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 64,
          //             icon: Icon(
          //               _isPlaying
          //                   ? Icons.pause_circle_outline
          //                   : Icons.play_circle_outline,
          //             ),
          //             onPressed: () {
          //               setState(
          //                 () {
          //                   _isPlaying = !_isPlaying;
          //                   _sliderController?.setAutoSliderEnabled(_isPlaying);
          //                 },
          //               );
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 48,
          //             icon: Icon(Icons.skip_next),
          //             onPressed: () {
          //               _sliderController?.nextPage();
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 0,
            // right: width * 0.01,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: Offset(0, 0),
                delay: Duration(seconds: 1),
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/mainbanner.jpg',
                  height: width < 1200 ? height * 0.8 : height,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.1),
                //     Colors.white.withOpacity(0.9),
                //     Colors.white,
                //   ],
                // ),
                ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(width * 0.04, height * 0.2, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 220,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.5)),
                  child: AdaptiveText(
                    "Welcome",
                    style: GoogleFonts.poppins(
                        // backgroundColor: Colors.yellow,
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.orange.withOpacity(0.4)),
                  child: AdaptiveText(
                    "To",
                    style: GoogleFonts.poppins(
                        // backgroundColor: Colors.yellow,
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.7)),
                  child: AdaptiveText(
                    "ALL INDIA VAISH FEDERATION U.P.",
                    style: GoogleFonts.poppins(
                        // backgroundColor: Colors.yellow,
                        fontSize: height * 0.075,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ),

                // AdaptiveText(
                //   "WELCOME TO All India Vaish Federation! ",
                //   style: GoogleFonts.montserrat(
                //     fontSize: height * 0.03,
                //     fontWeight: FontWeight.w300,
                //     color:
                //         _themeProvider.lightTheme ? Colors.black : Colors.white,
                //   ),
                // ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [

                //     EntranceFader(
                //       offset: Offset(0, 0),
                //       delay: Duration(seconds: 2),
                //       duration: Duration(milliseconds: 800),
                //       child: Image.asset(
                //         "assets/hi.gif",
                //         height: height * 0.05,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: height * 0.04,
                // ),
                // AdaptiveText(
                //   "Muhammad",
                //   style: GoogleFonts.montserrat(
                //       fontSize: width < 1200 ? height * 0.085 : height * 0.095,
                //       fontWeight: FontWeight.w100,
                //       color: _themeProvider.lightTheme
                //           ? Colors.black
                //           : Colors.white,
                //       letterSpacing: 4.0),
                // ),

                // EntranceFader(
                //   offset: Offset(-10, 0),
                //   delay: Duration(seconds: 1),
                //   duration: Duration(milliseconds: 800),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.play_arrow_rounded,
                //         color: kPrimaryColor,
                //       ),
                //       TyperAnimatedTextKit(
                //           isRepeatingAnimation: true,
                //           speed: Duration(milliseconds: 50),
                //           textStyle: GoogleFonts.montserrat(
                //             fontSize: height * 0.03,
                //             fontWeight: FontWeight.w200,
                //             color: _themeProvider.lightTheme
                //                 ? Colors.black
                //                 : Colors.white,
                //           ),
                //           text: [
                //             " Flutter Developer",
                //             " Technical Writer",
                //             " UI/UX Enthusiast"
                //           ]),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: height * 0.05,
                // ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: List.generate(
                //     kSocialIcons.length,
                //     (index) => WidgetAnimator(
                //       child: SocialMediaIconBtn(
                //         icon: kSocialIcons[index],
                //         socialLink: kSocialLinks[index],
                //         height: height * 0.035,
                //         horizontalPadding: width * 0.005,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
