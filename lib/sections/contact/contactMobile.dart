import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/footer/footersection.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactMobileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
            ),
            CustomSectionHeading(text: "\nGet in Touch"),
            SizedBox(
              height: 20,
            ),

            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int itemIndex, int i) =>
                  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ProjectCard(
                  cardWidth: width > 480 ? width * 0.5 : width * 0.8,
                  projectIconData: kContactIcons[i],
                  projectTitle: kContactTitles[i],
                  projectDescription: kContactDetails[i],
                ),
              ),
              options: CarouselOptions(
                  height: height * 0.3,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: false),
            ),
            SizedBox(
              height: 60,
            ),

            Text("Have anything to ask!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.deepOrange[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 32))),
            SizedBox(
              height: 10,
            ),
            Text("Free free to Drop a Message!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: TextField(
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Full Name*",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none)),
                ),
              ),
            ),
            // SizedBox(
            //   height: 12,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: TextField(
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Mobile Number*",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextField(
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Email ID",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: TextField(
                      maxLength: 160,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Message*",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: Text("Submit",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(color: Colors.white))),
                      ),
                      Icon(
                        Icons.send,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 60,
            ),
            FooterSection()

            // WidgetAnimator(
            //   child: Container(
            //     width: width,
            //     padding: EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       color: Colors.orange[50]!.withOpacity(0.9),
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withAlpha(100),
            //           blurRadius: 12.0,
            //           offset: Offset(0.0, 0.0),
            //         )
            //       ],
            //     ),
            //     child: Column(
            //         // crossAxisAlignment: CrossAxisAlignment.center,
            //         children: []),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
