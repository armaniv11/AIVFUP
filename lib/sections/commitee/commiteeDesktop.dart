import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/commitee/national_commitee_tile_desktop.dart';
import 'package:folio/sections/getInTouch/getInTouchDesktop.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/footer.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:html' as html;

class CommiteeDesktop extends StatefulWidget {
  @override
  State<CommiteeDesktop> createState() => _CommiteeDesktopState();
}

class _CommiteeDesktopState extends State<CommiteeDesktop> {
  bool isHovered = false;
  bool isReadMoreOn = false;
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(0, -10, 0);
    final transform = isHovered ? hovered : Matrix4.identity();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomSectionHeading(
                  text: "\nराष्ट्रीय पदाधिकारी ",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              WidgetAnimator(
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
                                image: AssetImage('assets/girishsanghi.jpg'),
                                fit: BoxFit.fill)),
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
                            "डॉ.गिरीश कुमार सांघी (पूर्व सांसद)",
                            style: GoogleFonts.montserrat(
                                color: Colors.red[800],
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          AdaptiveText(
                            "राष्ट्रीय अध्यक्ष",
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
                            AppConstants.girishInfo,
                            style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
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
              )),
              SizedBox(
                height: 90,
              ),
              WidgetAnimator(
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
                                image: AssetImage('assets/gopalmor.jpeg'),
                                fit: BoxFit.fill)),
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
                            "श्री गोपाल मोर ",
                            style: GoogleFonts.montserrat(
                                color: Colors.red[800],
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          AdaptiveText(
                            "राष्ट्रीय महामंत्री ",
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
                            AppConstants.gopalMorInfo,
                            style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
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
              )),
              // NationalCommiteeTile(
              //     image: 'gopalmor.jpeg',
              //     name: "श्री गोपाल मोर",
              //     post: "राष्ट्रीय महामंत्री ",
              //     height: height / 2,
              //     width: width / 4.5,
              //     info: AppConstants.gopalMorInfo),

              SizedBox(
                height: 90,
              ),

              WidgetAnimator(
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
                                image: AssetImage('assets/umeshagarwal.jpg'),
                                fit: BoxFit.fill)),
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
                            "श्री उमेश अग्रवाल (पूर्व विधायक)",
                            style: GoogleFonts.montserrat(
                                color: Colors.red[800],
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          AdaptiveText(
                            "राष्ट्रीय महामंत्री ",
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
                            height: 40,
                          ),
                          AdaptiveText(
                            AppConstants.umeshInfo,
                            style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
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
              )),
              SizedBox(
                height: 90,
              ),

              WidgetAnimator(
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
                                image: AssetImage('assets/arunaji.jpg'),
                                fit: BoxFit.fill)),
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
                            "श्रीमती अरुणा ओसवाल ",
                            style: GoogleFonts.montserrat(
                                color: Colors.red[800],
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          AdaptiveText(
                            "राष्ट्रीय महिला अध्यक्ष",
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
                            height: 40,
                          ),
                          AdaptiveText(
                            AppConstants.arunaInfo,
                            style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
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
              )),
              SizedBox(
                height: 90,
              ),

              WidgetAnimator(
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
                                image: AssetImage('assets/snchandak.jpg'),
                                fit: BoxFit.fill)),
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
                            "डॉ. एस. एन. चांडक ",
                            style: GoogleFonts.montserrat(
                                color: Colors.red[800],
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          AdaptiveText(
                            "राष्ट्रीय कोषाध्यक्ष ",
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
                            height: 40,
                          ),
                          AdaptiveText(
                            AppConstants.snchandakInfo,
                            style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
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
              )),

              SizedBox(
                height: 60,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    html.window
                        .open('assets/images/nationalcommitee.jpeg', "_blank");
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Read More",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 60,
              ),
              Footer(),

              // GetInTouchDesktop()
              // const SizedBox(
              //   height: 25.0,
              // ),
              // OutlinedCustomBtn(
              //     btnText: "Let's Work Together",
              //     onPressed: () => Navigator.pushNamed(context, '/workTogether')),
            ],
          ),
        ),
      ),
    );
  }
}
