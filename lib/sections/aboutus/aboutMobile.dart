import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/footer/footersection.dart';
import 'package:folio/sections/news/newsMobileForHome.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutUsMobileTab extends StatefulWidget {
  @override
  State<AboutUsMobileTab> createState() => _AboutUsMobileTabState();
}

class _AboutUsMobileTabState extends State<AboutUsMobileTab> {
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
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              WidgetAnimator(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/maharajaagrasen.jpg',
                      height: height * 0.8,
                      width: width,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AdaptiveText(
                      "महाराजा अग्रसेन जी",
                      style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: 24.0,
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
                      "महाराजा अग्रसेन जी का जन्म सुर्यवंशी भगवान श्रीराम जी के पुत्र कुश की चौतीस वी पीढ़ी में द्वापर के अंतिम काल (याने महाभारत काल) एवं कलयुग के प्रारंभ में अश्विन शुक्ल एकम को हुआ। कालगणना के अनुसार विक्रम संवत आरंभ होने से 3130 वर्ष पूर्व अर्थात ( 3130+ संवत 2073) याने आज से 5203 वर्ष पूर्व हुआ। वृहत्सेन जी अग्रसेन के दादा जी थे। वे प्रतापनगर के महाराजा वल्लभसेन एवं माता भगवती देवी के ज्येष्ठ पुत्र थे। प्रतापनगर, वर्तमान में राजस्थान एवं हरियाणा राज्य के बीच सरस्वती नदी के किनारे स्थित था। बालक अग्रसेन को शिक्षा ग्रहण करने के लिए मुनि तांडेय के आश्रम भेजा जाता है। जहां से अग्रसेन एक अच्छे शासक बनने के गुण लेकर निकलते है। 15 वर्ष की आयु में, अग्रसेन जी ने महाभारत के युद्ध में पांडवो के पक्ष में युद्ध लड़ा था। उनके पिता महाराज वल्लभसेन युद्ध के दसवे दिन भीष्म पितामह के बाणों से वीरगती को प्राप्त हुए। तब शोकाकुल अग्रसेन को भगवान श्रीकृष्ण ने शोक से उबरने का दिव्य ज्ञान देकर पिता का राजकाज संभालने का निर्देश दिया।",
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
                    isReadMoreOn
                        ? SizedBox()
                        : Container(
                            height: 60,
                            // width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepOrange,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 4.0,
                                  offset: Offset(1.0, 1.0),
                                )
                              ],
                            ),
                            // padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              hoverColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                // side: BorderSide(color: kPrimaryColor)
                              ),
                              onPressed: () {
                                setState(() {
                                  isReadMoreOn = true;
                                });
                              },
                              child: Text(
                                "Read More",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                  ],
                ),
              )),
              !isReadMoreOn
                  ? SizedBox()
                  : SizedBox(
                      height: 60,
                    ),

              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "करने पड़े थे दो विवाह",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "महाराजा अग्रसेन जी का पहला विवाह नागराज कुमुद की कन्या माधवी जी से हुआ था। इस विवाह में स्वयंवर का आयोजन किया गया था, जिसमें राजा इंद्र ने भी भाग लिया था। माधवी जी के अग्रसेन जी को वर के रुप में चुनने से इंद्र को अपना अपमान महसूस हुआ और उन्होंने प्रतापनगर में अकाल की स्थिति निर्मित कर दी। तब प्रतापनगर को इस संकट से बचाने के लिए उन्होंने माता लक्ष्मी जी की आराधना की। माता लक्ष्मी जी ने प्रसन्न होकर अग्रसेन जी को सलाह दी कि यदि तुम कोलापूर के राजा नागराज महीरथ की पुत्री का वरण कर लेते हो तो उनकी शक्तियां तुम्हें प्राप्त हो जाएंगी। तब इंद्र को तुम्हारे सामने आने के लिए अनेक बार सोचना पडेगा। इस तरह उन्होंने राजकुमारी सुंदरावती से दूसरा विवाह कर प्रतापनगर को संकट से बचाया। दो-दो नाग वंशो से संबंध स्थापित करने के बाद महाराज अग्रसेन के राज्य में अपार सूख-समृध्दि व्याप्त हुई। इंद्र भी अग्रसेन जी से मैत्री करने बाध्य हुए। दो दो नागराजों से संबंध होने के कारण ही अग्रवाल समाज नागों को अपने मामा मानते है।",
                          style: GoogleFonts.montserrat(
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),

              !isReadMoreOn
                  ? SizedBox()
                  : SizedBox(
                      height: 40,
                    ),

              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "अग्रोहा धाम",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          child: Center(
                            child: AdaptiveText(
                              "महाराजा अग्रसेन ने अपने नए राज्य की स्थापना के लिए रानी माधवी के साथ पूरे राज्य का भ्रमण किया। इसी दौरान उन्हें एक जगह एक शेरनी शावक को जन्म देते दिखी। शावक ने महाराजा अग्रसेन के हाथी को अपनी माँ के लिए संकट समझकर तत्काल हाथी पर छलांग लगा दी। इसे दैवीय संदेश समझकर ॠषि मुनियों और ज्योतिषियों की सलाह पर यहां पर नए राज्य की स्थापना कर, नये राज्य का नाम अग्रेयगण या अग्रोदय रखा गया और जिस जगह शावक का जन्म हुआ था उस जगह अग्रोदय की राजधानी अग्रोहा की स्थापना की गई। यह जगह आज के हरियाणा के हिसार के पास है। आज भी यह स्थान अग्रवाल समाज के लिए पांचवे धाम के रूप में पूजा जाता है, वर्तमान में अग्रोहा विकास ट्रस्ट ने बहुत सुंदर मन्दिर, धर्मशालाएं आदि बनाकर यहां आने वाले अग्रवाल समाज के लोगो के लिए सुविधायें जुटा दी है।",
                              style: GoogleFonts.montserrat(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/agrohadham.jpg',
                          height: height / 2,
                          width: double.maxFinite,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                      ],
                    ),

              !isReadMoreOn
                  ? SizedBox()
                  : SizedBox(
                      height: 30,
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "'एक ईट और एक रुपया' का समाजवादी सिद्धांत",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: AdaptiveText(
                        "एक बार अग्रोहा में अकाल पड़ने पर चारों ओर त्राहि-त्राहि मच गई। ऐसे में समस्या का समाधान ढुंढ़ने के लिए अग्रसेन जी वेश बदलकर नगर भ्रमण कर रहे थे। उन्होंने देखा कि एक परिवार में सिर्फ चार सदस्यों का ही खाना बना था। लेकिन खाने के समय एक अतिरिक्त मेहमान के आने पर भोजन की समस्या हो गई। तब परिवार के सदस्यों ने चारों थालियों में से थोड़ा-थोड़ा भोजन निकालकर पांचवी थाली परोस दी। मेहमान की भोजन की समस्या का समाधान हो गया। इस घटना से प्रेरित होकर उन्होंने ‘एक ईट और एक रुपया’ के सिद्धांत की घोषणा की। जिसके अनुसार नगर में आने वाले हर नए परिवार को नगर में रहनेवाले हर परिवार की ओर से एक ईट और एक रुपया दिया जाएं। ईटों से वो अपने घर का निर्माण करें एवं रुपयों से व्यापार करें। इस तरह महाराजा अग्रसेन जी को समाजवाद के प्रणेता के रुप में पहचान मिली। महाराजा अग्रसेन जी की इसी विचारधारा का प्रभाव है कि आज भी अग्रवाल समाज शाकाहारी, अहिंसक एवं धर्मपरायण के रुप में प्रतिष्ठित है।",
                        style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : SizedBox(
                      height: 30,
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "निकट संबंधोंं में विवाह पर रोक",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: AdaptiveText(
                        "उस समय निकट संबंधों में ही बच्चों की शादियां करने का चलन था। विज्ञान के अनुसार यह अनुचित था। तब अग्रसेन जी ने सर्वसंमति से यह निर्णय लिया कि अपने पुत्र और पुत्री का विवाह सगोत्र में नहीं करेंंगे। इसके लिए उन्होंने अपने पुत्रों को 18 गोत्रों का मुखिया बनाया और सगोत्र विवाह पर रोक लगाई। आज भी अग्रवालों में यह प्रथा प्रचलित है।",
                        style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : SizedBox(
                      height: 30,
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "अग्रसेन जी का अंतिम समय",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: AdaptiveText(
                        "महाराजा अग्रसेन ने 108 वर्षों तक राज किया। एक निश्चिंत आयु प्राप्त करने के बाद कुलदेवी महालक्ष्मी से परामर्श कर वे आग्रेय गणराज्य का शासन अपने ज्येष्ठ पुत्र विधु के हाथों में सौंप कर तपस्या करने चले गए।",
                        style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : SizedBox(
                      height: 30,
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: AdaptiveText(
                          "भारत सरकार द्वारा प्राप्त सम्मान",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              !isReadMoreOn
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: AdaptiveText(
                        "• महाराजा अग्रसेन के नाम पर 24 सितंबर 1976 में भारत सरकार ने 25 पैसे का डाक टिकट जारी किया था।\n• सन 1995 में भारत सरकार ने दक्षिण कोरिया से 350 करोड़ रुपए में एक विशेष तेल वाहक जहाज खरिदा, जिसका नाम “महाराजा अग्रसेन’’ रखा गया।",
                        style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
              SizedBox(
                height: 40,
              ),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
