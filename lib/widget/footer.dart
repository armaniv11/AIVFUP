import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      // padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, 40),
      // margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      // height: height * 0.07,
      width: width,
      color: Colors.grey[900],
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, bottom: 16, top: 8),
                        child: AdaptiveText(
                          "उ०प्र० में प्रचलित वैश्य उपवर्ग",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange),
                        ),
                      ),
                      AdaptiveText(
                        """अग्रवाल, मारवाड़ी, खंडेलवाल, महेश्वरी, अग्रहरि, गुलहरे, माहौर, शिवहरे, जैन (जैनी), वार्ष्णेय (बारहसैनी), केसरवानी, दोसर, गहोई, जायसवाल, कसौधन, बाथम, ओमर (उमर), माथुर, कमलापुरी  (कमलापुरी), अयोध्यावासी, बरनवाल, सन्मानी, महाजन, चौसैनी. रौनियार, रस्तोगी (रोहतिकी), विश्नोई, पोरवाल (पुरवाल), तैलिक (साहू/ राठौर), अंग्यार, यञसेनी (हलवाई), मोदनवाल, ओनाय, सोनी (स्वर्णकार), हरिद्वारी, कुमारतनय, मध्यदेशीय, पटवा, कान्यकुब्ज, सेठी, चौरसिया, कसेरा, राजवंशी भुर्जी, ग्वारे, महावर, कान्दू, ऊनाय """,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: 1.4,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width / 6,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, bottom: 8, top: 8),
                        child: AdaptiveText(
                          "हमारे साथ जुड़ें",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          openNewTab(
                              setUrl:
                                  'https://www.facebook.com/Vaish-Federation-UP-100402879448494',
                              setTitle: "Facebook");
                        },
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                            AdaptiveText(
                              "Facebook",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "Twitter",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // AdaptiveText(
                      //   "Developed in 💙 with ",
                      //   style: GoogleFonts.montserrat(
                      //     fontWeight: FontWeight.w300,
                      //     color: _themeProvider.lightTheme ? Colors.black : Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  width: width / 4.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: AdaptiveText(
                          """संपर्क""",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "24, एम0जी0 मार्ग, हलवासिया कोर्ट, लखनऊ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "+91 726-303-9909, +91 885-892-0668",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "vaishfederationup@gmail.com",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: width,
            color: Colors.deepOrange,
            child: Center(
                child: Wrap(
              children: [
                Text(" All India Vaish Federation. ",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            letterSpacing: 1.2, color: Colors.white))),
                Text("\u00a9 2022 All Rights Reserved",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1.2,
                        textStyle: TextStyle(color: Colors.white))),
              ],
            )),
          )
        ],
      ),
    );
  }
}

openNewTab({String? setUrl, String? setTitle}) {
  return html.window.open(
    setUrl!,
    setTitle!,
  );
}

class FooterMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      // padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, 40),
      // margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      // height: height * 0.07,
      width: width,
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, bottom: 16, top: 8),
                        child: AdaptiveText(
                          "उ०प्र० में प्रचलित वैश्य उपवर्ग",
                          style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange),
                        ),
                      ),
                      AdaptiveText(
                        """अग्रवाल, मारवाड़ी, खंडेलवाल, महेश्वरी, अग्रहरि, गुलहरे, माहौर, शिवहरे, जैन (जैनी), वार्ष्णेय (बारहसैनी), केसरवानी, दोसर, गहोई, जायसवाल, कसौधन, बाथम, ओमर (उमर), माथुर, कमलापुरी  (कमलापुरी), अयोध्यावासी, बरनवाल, सन्मानी, महाजन, चौसैनी. रौनियार, रस्तोगी (रोहतिकी), विश्नोई, पोरवाल (पुरवाल), तैलिक (साहू/ राठौर), अंग्यार, यञसेनी (हलवाई), मोदनवाल, ओनाय, सोनी (स्वर्णकार), हरिद्वारी, कुमारतनय, मध्यदेशीय, पटवा, कान्यकुब्ज, सेठी, चौरसिया, कसेरा, राजवंशी भुर्जी, ग्वारे, महावर, कान्दू, ऊनाय """,
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.w300,
                          fontSize: 16,
                          // letterSpacing: ,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, bottom: 8, top: 8),
                        child: AdaptiveText(
                          "हमारे साथ जुड़ें",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          openNewTab(
                              setUrl:
                                  'https://www.facebook.com/Vaish-Federation-UP-100402879448494',
                              setTitle: "Facebook");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                            AdaptiveText(
                              "Facebook",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "Twitter",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // AdaptiveText(
                      //   "Developed in 💙 with ",
                      //   style: GoogleFonts.montserrat(
                      //     fontWeight: FontWeight.w300,
                      //     color: _themeProvider.lightTheme ? Colors.black : Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: AdaptiveText(
                          "संपर्क करें",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "24, एमoजीo मार्ग, हलवासिया कोर्ट, लखनऊ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "+91 726-303-9909, +91 885-892-0668",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          AdaptiveText(
                            "vaishfederationup@gmail.com",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: width,
            color: Colors.deepOrange,
            child: Center(
                child: Wrap(
              children: [
                Text(" All India Vaish Federation. ",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            letterSpacing: 1.2, color: Colors.white))),
                Text("\u00a9 2022 All Rights Reserved",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1.2,
                        textStyle: TextStyle(color: Colors.white))),
              ],
            )),
          )
        ],
      ),
    );
  }
}
