import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
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

class ContactDesktop extends StatefulWidget {
  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.85260059453537, 80.9417172678214),
    zoom: 14.4746,
  );
  bool isHovered = false;
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
            children: [
              CustomSectionHeading(
                text: "\nGet in Touch",
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  kContactIcons.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: WidgetAnimator(
                      child: ProjectCard(
                        cardWidth: width < 1200 ? width * 0.25 : width * 0.27,
                        cardHeight:
                            width < 1200 ? height * 0.28 : height * 0.30,
                        bgColor: kContactTileColor[index],
                        projectIconData: kContactIcons[index],
                        projectTitle: kContactTitles[index],
                        projectDescription: kContactDetails[index],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              WidgetAnimator(
                child: Container(
                  width: width * 0.84,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.orange[50]!.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 12.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Have anything to ask!",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.deepOrange[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32))),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Free free to Drop a Message!",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10),
                                  child: TextField(
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                      // controller: nameController,
                                      decoration: InputDecoration(
                                          labelText: "Full Name*",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none)),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10),
                                  child: TextField(
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                      // controller: nameController,
                                      decoration: InputDecoration(
                                          labelText: "Mobile Number*",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none)),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10),
                                  child: TextField(
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                      // controller: nameController,
                                      decoration: InputDecoration(
                                          labelText: "Email ID",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none)),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10),
                                  child: TextField(
                                      maxLength: 160,
                                      maxLines: 4,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                      // controller: nameController,
                                      decoration: InputDecoration(
                                          labelText: "Message*",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none)),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[800],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 20),
                                          child: Text("Submit",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.white))),
                                        ),
                                        Icon(
                                          Icons.send,
                                          color: Colors.white,
                                        )
                                      ],
                                    )),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: height * 0.6,
                width: width * 0.84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 12.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: GoogleMap(
                  mapType: MapType.satellite,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
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
