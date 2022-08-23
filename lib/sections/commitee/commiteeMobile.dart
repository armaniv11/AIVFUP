import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/footer/footersection.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:provider/provider.dart';

class CommiteeMobileTab extends StatefulWidget {
  @override
  State<CommiteeMobileTab> createState() => _CommiteeMobileTabState();
}

class _CommiteeMobileTabState extends State<CommiteeMobileTab> {
  bool isHovered = false;
  bool isReadMoreOn = false;
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  text: "\nराष्ट्रीय समिति",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CustomImageWithTitle(
                  name: "डॉ.गिरीश कुमार सांघी (पूर्व सांसद)",
                  post: "राष्ट्रीय अध्यक्ष",
                  desc: AppConstants.girishInfo,
                  imgurl: 'assets/girishsanghi.jpg'),

              CustomImageWithTitle(
                  name: "श्री गोपाल मोर ",
                  post: "राष्ट्रीय महामंत्री ",
                  desc: AppConstants.gopalMorInfo,
                  imgurl: 'assets/gopalmor.jpeg'),

              CustomImageWithTitle(
                  imgurl: 'assets/umeshagarwal.jpg',
                  name: "श्री उमेश अग्रवाल",
                  post: "राष्ट्रीय महामंत्री (पूर्व विधायक)",
                  desc: AppConstants.umeshInfo),
              CustomImageWithTitle(
                  imgurl: 'assets/arunaji.jpg',
                  name: "श्रीमती अरुणा ओसवाल ",
                  post: "राष्ट्रीय महिला अध्यक्ष",
                  desc: AppConstants.arunaInfo),
              CustomImageWithTitle(
                  imgurl: 'assets/snchandak.jpg',
                  name: "डॉ. एस. एन. चांडक",
                  post: "राष्ट्रीय कोषाध्यक्ष",
                  desc: AppConstants.snchandakInfo),

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
              FooterSection(),

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

class CustomImageWithTitle extends StatelessWidget {
  final String imgurl, name, post, desc;
  const CustomImageWithTitle(
      {Key? key,
      required this.name,
      required this.post,
      required this.desc,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        WidgetAnimator(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                height: size.height / 2.5,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(imgurl), fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20,
              ),
              AdaptiveText(
                name,
                style: GoogleFonts.montserrat(
                    color: Colors.red[800],
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold),
              ),
              AdaptiveText(
                post,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              AdaptiveText(
                desc,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
