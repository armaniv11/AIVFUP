import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/footer/footersection.dart';
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

import '../media/mediaDesktop.dart';

class AboutUsDesktop extends StatefulWidget {
  final bool isMobile;

  const AboutUsDesktop({Key? key, this.isMobile = false}) : super(key: key);
  @override
  State<AboutUsDesktop> createState() => _AboutUsDesktopState();
}

class _AboutUsDesktopState extends State<AboutUsDesktop> {
  bool isHovered = false;
  bool isReadMoreOn = false;

  List<String> ishtdev = [
    'agrasen.jpg',
    'mahaveer.jpg',
    'akroor1.jpg',
    'ganinath1.jpg',
    'harishchandra1.jpg',
    'rajrajeshwar1.jpg',
    'sundardas1.jpg',
    'ramcharan1.jpg',
  ];
  List<String> images = [
    'gandhi.jpg',
    'bhagwandas1.jpg',
    'bhartendu1.jpg',
    'bhamashah.jpg',
    'bph.jpeg',
    'balmukund1.jpg',
    'brijbhan1.jpg',
    'deshbandhu1.jpg',
    'ghanshyam1.jpg',
    'hanuman1.jpg',
    'hukmchand1.jpg',
    'jaishankar1.jpg',
    'maithlisharan1.jpg',
    'raibahadur1.jpg',
    'rameshwar1.jpg',
    'ramnath1.jpg',
    'ramdas.jpg',
    'ramprakash1.jpg',
    'rosaiya1.jpg',
    'seetaram1.jpg',
    'shadilal1.jpg',
    'virendra1.jpg',
    'ashoksinghal.jpg',
    'banarasidas.jpg',
    'chandrabhan.jpg',
    'dauji.jpg',
    'jainarayan.jpg',
    'lajpatrai.jpg',
    'lalluram.jpg',
    'rameshagarwal.jpg',
    'rammanohar.jpg',
    'jamnalal.png',
    'lalbahadur.jpg',
    'tulsi.jpg',
    'omprakash.jpg',
    'narendra.jpg',
    'banarasi.jpg',
    'heeralal.jpg',
  ];
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
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              widget.isMobile
                  ? Center(
                      child: Text(
                        "वैश्य समाज का गौरवशाली इतिहास",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                    )
                  : Center(
                      child: CustomSectionHeading(
                        text: "\nवैश्य समाज का गौरवशाली इतिहास",
                      ),
                    ),
              SizedBox(
                height: 60,
              ),

              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.isMobile ? 8 : 80),
                child: AdaptiveText(
                  "वैदिक युग के आगमन के बाद से, एक समुदाय जिसने आज भारत में बहुत योगदान दिया है, वह कोई और नहीं बल्कि वैश्य समुदाय है। चाहे उसकी अर्थव्यवस्था हो, राजनीति हो, समाज हो या संस्कृति, इस समुदाय ने एक अमिट छाप छोड़ी है। इस समाज के महत्व को जानने के लिए कोई भी इतिहास के पन्नों को पलट सकता है। वैश्य समुदाय ने सामाजिक, सांस्कृतिक, आध्यात्मिक, राजनीतिक, शैक्षिक, औद्योगिक, साहित्य और पत्रकारिता के रूप में विविध क्षेत्रों में अग्रणी प्रकाशकों का उत्पादन किया है। निस्संदेह, इस समुदाय ने अद्भुत उपलब्धियों के नए मानकों को परिभाषित किया है जो राष्ट्रीय और अंतरराष्ट्रीय स्तर पर समाज के अन्य समुदायों के लिए अनुकरणीय हैं। प्राचीन शास्त्रों के अनुसार वैश्य की उत्पत्ति ब्रह्मा की जांघों से हुई थी। इसका कर्तव्य कृषि, पशुपालन और व्यापार के माध्यम से समुदायों की समृद्धि सुनिश्चित करना था। बाद में, वे विक्रेता और व्यापारी बन गए। जैसा कि द्विज वैश्य समुदाय आर्थिक रूप से मजबूत हो गया क्योंकि उन्होंने वाणिज्य को नियंत्रित किया था। उनमें से कई प्रभावशाली लोगों को गौरवशाली उपाधियों से सम्मानित किया गया। \nइस समुदाय ने महाराजा अग्रसेन, संत सुंदर दास, भामा शाह, राजा अशोक, चंद्रगुप्त, चाणक्य, महात्मा गांधी, राम मोनोहर लोहिया, लाला लाजपत राय, जय शंकर प्रसाद, मैथली शरण गुप्ता आदि को सांस्कृतिक, सामाजिक, राजनीतिक के दायर में पेश किया है। , आध्यात्मिक, साहित्य और पत्रकारिता। हमारे देश की आजादी में लाखों वैश्य लोगों ने योगदान दिया है। महात्मा गांधी और उनके अनुयायी वैश्य समाज से थे। इस समुदाय ने श्री घनश्याम दास जी बिड़ला, जमनालाल जी बजाज, दुर्गा प्रसाद मंडेलिया, गुजरमल मोदी, कमला पंत सिंघानिया आदि जैसे हजारों उद्यमी देश को दिए हैं। \nउनके प्रयासों और दूरदृष्टि से ही देश आर्थिक रूप से आगे बढ़ सकता है। डॉ विक्रम साराभाई, डॉ आत्माराम, डॉ डी सी कोठारी आदि जैसे वैज्ञानिक और विद्वान, संत तुकाराम, संत सुंदर दास, आचार्य तुलसी, और मुनि विद्यानंद आदि जैसे आध्यात्मिक नेता, श्री प्रकाश, श्री मान नारायण, आचार्य जैसे समाज सुधारक नरेंद्र देव, लाला लाजपत राय, डॉ. आर.एम. लोहिया, सेठ गोविंद दास, हनुमान प्रसाद पोद्दार, देशबंधु गुप्ता आदि, लेखक, कवि और पत्रकार जैसे भारतेंदु हरीश चंद्र, जय शंकर प्रसाद, मैथलीशरण गुप्त, जैनेंद्र कुमार, काका हाथरसी, विष्णु प्रभाकर, डोरी लाल अग्रवाल, चंद्र भानु गुप्ता, बनारसी दास गुप्ता, सीताराम केसरी और अन्य को हमेशा उनके महान योगदान के लिए सम्मानित किया गया है।",
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.026,
                    color: Colors.grey[800],
                    height: 2.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 60,
              ),
              Center(
                child: CustomSectionHeading(
                  text: "\nहमारे इष्ट देव",
                ),
              ),

              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Wrap(
                    children: List.generate(ishtdev.length, (index) {
                  return WidgetAnimator(
                    child: ImageItem(
                      imageName: ishtdev[index].toString(),
                      isNetworkImage: false,
                    ),
                  );
                })),
              ),
              SizedBox(
                height: 90,
              ),

              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),

              Center(
                child: CustomSectionHeading(
                  text: "\nहमारे प्रेरणाश्रोत ",
                ),
              ),

              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 60,
              ),

              Center(
                child: Wrap(
                    children: List.generate(images.length, (index) {
                  return WidgetAnimator(
                    child: ImageItem(
                      imageName: images[index].toString(),
                      isNetworkImage: false,
                    ),
                  );
                })),
              ),
              SizedBox(
                height: 60,
              ),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
