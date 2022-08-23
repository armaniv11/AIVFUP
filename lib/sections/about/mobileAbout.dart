import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/about/custom_widgets/marquee_widget.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/widget/aboutMeMetaData.dart';
import 'package:folio/widget/communityIconBtn.dart';
import 'package:folio/widget/toolsTechWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_sections/imagewithdetail.dart';
import '../news/newsMobileForHome.dart';

class AboutMobile extends StatelessWidget {
  final _communityLogoHeight = [40.0, 50.0, 20.0];

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: _themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 4),
                child: AdaptiveText(
                  "अपडेट ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.045,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepOrange),
                ),
              ),
              AvatarGlow(
                glowColor: Colors.yellow,
                endRadius: 20.0,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MarqueeWidget(width: width),
          ),
          SizedBox(height: 30.0),

          // CustomSectionHeading(
          //   text: "",
          //   isMobile: true,
          // ),

          // Row(
          //   children: [

          Text(
            "कुल देवी महालक्मी जी",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800]),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: height * 0.5,
                width: width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(),
                    image: DecorationImage(
                        image: AssetImage('assets/laxmiji.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "वैश्य समाज का गौरवशाली इतिहास",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[800]!, width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdaptiveText(
              "वैदिक युग के आगमन के बाद से, एक समुदाय जिसने आज भारत में बहुत योगदान दिया है, वह कोई और नहीं बल्कि वैश्य समुदाय है। चाहे उसकी अर्थव्यवस्था हो, राजनीति हो, समाज हो या संस्कृति, इस समुदाय ने एक अमिट छाप छोड़ी है। इस समुदाय के महत्व को जानने के लिए कोई भी इतिहास के पन्नों में फेरबदल कर सकता है। \n वैश्य समुदाय ने सामाजिक, सांस्कृतिक, आध्यात्मिक, राजनीतिक, शैक्षिक, औद्योगिक, साहित्य और पत्रकारिता के रूप में विविध क्षेत्रों में अग्रणी प्रकाशकों का उत्पादन किया है। निस्संदेह, इस समुदाय ने अद्भुत उपलब्धियों के नए मानकों को परिभाषित किया है जो राष्ट्रीय और अंतरराष्ट्रीय स्तर पर समाज के अन्य समुदायों के लिए अनुकरणीय हैं। प्राचीन शास्त्रों के अनुसार वैश्य की उत्पत्ति ब्रह्मा की जांघों से हुई थी। इसका कर्तव्य कृषि, पशुपालन और व्यापार के माध्यम से समुदायों की समृद्धि सुनिश्चित करना था। बाद में, वे विक्रेता और व्यापारी बन गए। जैसा कि द्विज वैश्य समुदाय आर्थिक रूप से मजबूत हो गया क्योंकि उन्होंने वाणिज्य को नियंत्रित किया था। उनमें से कई प्रभावशाली लोगों को गौरवशाली उपाधियों से सम्मानित किया गया।",
              style: GoogleFonts.montserrat(
                fontSize: height * 0.026,
                color: Colors.grey[800],
                height: 2.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              // style: ElevatedButton.styleFrom(
              //     primary: Colors.red[800], onPrimary: Colors.red),
              // style: ButtonStyle(backgroundColor:Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, '/aboutus');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Read More",
                  style: TextStyle(color: Colors.white),
                ),
              )),

          SizedBox(
            height: height * 0.2,
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: height * 0.5,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(),
                        image: DecorationImage(
                            image: AssetImage('assets/aboutusimage.jpeg'),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdaptiveText(
                  AppConstants.letter,
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.026,
                    color: Colors.grey[800],
                    height: 2.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),
          SizedBox(
            height: height * 0.2,
          ),
          Container(
            width: width,
            // height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: height * 0.6,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(),
                          image: DecorationImage(
                              image: AssetImage('assets/mainphoto.jpg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                AdaptiveText(
                  "सुधीर एस. हलवासिया",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.043,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange),
                ),
                AdaptiveText(
                  "प्रदेश अध्यक्ष, उत्तर प्रदेश",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[800]!, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                AdaptiveText(
                  "प्रदेश संयोजक, आर्थिक प्रकोष्ट एवम ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "पूर्व प्रदेश उपाध्यक्ष, भा. ज. पा. उ. प्र. ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[800]!, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                // SizedBox(
                //   height: height * 0.015,
                // ),
                AdaptiveText(
                  "पिता - स्व० बी०पी० हलवासिया (पूर्व मेयर)",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                ),
                AdaptiveText(
                  "जन्म तिथि - 3 अक्टूबर , 1961 , लखनऊ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                ),
                AdaptiveText(
                  "पता - हलवासिया कोर्ट, 24 महात्मा गाँधी मार्ग, हजरतगंज, लखनऊ - 226001",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                  textAlign: TextAlign.center,
                ),
                AdaptiveText(
                  "शैक्षिक योग्यता - बी०काम , एल.एल.बी.",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                ),
                AdaptiveText(
                  "कार्यक्षेत्र - समाज सेवा",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                ),
                AdaptiveText(
                  "मो.: +91 9415-012-000, +91 9839-075-000",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                ),
                AdaptiveText(
                  "ईमेल: halwasiyas@gmail.com",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]),
                ),
                SizedBox(
                  height: 20,
                ),

                AdaptiveText(
                  "अन्य महत्वपूर्ण दायित्व",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.040,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[800]!, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                AdaptiveText(
                  "पं० अटल बिहारी बाजपेई मेमोरियल फाउंडेशन - उपाध्यक्ष",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "अखिल भारीतय वैश्य महासम्मेलन (AIVF) - प्रदेश अध्यक्ष",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),

                AdaptiveText(
                  "इंडो अमेरिकन फ्रेंड्स ग्रुप (चैम्बर्स आफ कॉमर्स) - प्रदेश अध्यक्ष",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "लखनऊ व्यापर मंडल - संरक्षक",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "ताइक्वांडो फेडरेशन ऑफ़ इंडिया - राष्ट्रीय उपाध्यक्ष / कोषाध्यक्ष",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "यू.पी. ब्लाइंड एंड पैरा जुडो एसोसिएशन, उ.प्र. - महामंत्री",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "यू.पी. योगा एसोसिएशन - उपाध्यक्ष",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "यू.पी. जूडो एसोसिएशन - अध्यक्ष",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "अग्रवाल शिक्षा संसथान, मोती नगर, लखनऊ - मंत्री",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "अखिल भारतीय अग्रवाल सम्मेलन (अवध प्रदेश) - प्रांतीय चेयरमैन",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "श्री श्रीराधारमण बिहारी (पुराना इस्कान मंदिर), लखनऊ - सेक्रेटी",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "चेशायर होम लखनऊ (वृद्धा एवं दिव्यांग आश्रम) - सेक्रेटी",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "शहीद स्मृति समारोह समिति - संरक्षक",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "लखनऊ नर्सिंग होम एसोसिएशन एवं ब्लड बैंक - संरक्षक  ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  "लखनऊ प्राणी उद्यान सलाहकार समिति - सदस्य  ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AdaptiveText(
                  " . . . ",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          ),

          SizedBox(
            height: height * 0.2,
          ),
          Center(
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWithDetail(
                    img: "sa.jpg",
                    height: 0.5,
                    width: 1,
                    name: "शैलेन्द्र अग्रहरि ",
                    post: "प्रदेश महामंत्री, उत्तर प्रदेश",
                    mob: "मो.: +91 885-892-0668",
                    email: "Asd@gmail.com",
                    isMobile: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWithDetail(
                    img: "bbg.jpeg",
                    height: 0.5,
                    width: 1,
                    name: "भारत भूषण गुप्ता ",
                    post: "प्रदेश महामंत्री, उत्तर प्रदेश",
                    mob: "मो.: +91 9412-364-249",
                    email: "Asd@gmail.com",
                    isMobile: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWithDetail(
                    img: "sg.jpg",
                    height: 0.5,
                    width: 1,
                    name: "डॉ. सुधीर गुप्ता (एम.एल.सी.)",
                    post: "प्रदेश महामंत्री, उत्तर प्रदेश",
                    mob: "मो.: +91 9919-811-111",
                    email: "Asd@gmail.com",
                    isMobile: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
