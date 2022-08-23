import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/custom_widgets/custom_widget_animator.dart';
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
import 'dart:html' as html;

import 'commitee_table.dart';

class DistrictCommiteeDesktop extends StatefulWidget {
  final bool isMobile;

  const DistrictCommiteeDesktop({Key? key, required this.isMobile})
      : super(key: key);
  @override
  State<DistrictCommiteeDesktop> createState() =>
      _DistrictCommiteeDesktopState();
}

class _DistrictCommiteeDesktopState extends State<DistrictCommiteeDesktop> {
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

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),

              Center(
                child: CustomSectionHeading(
                    text: "\nजिला एवम महानगर अध्यक्ष ",
                    isMobile: widget.isMobile),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.jillaAdhyaksh,
                isMobile: widget.isMobile,
              ),

              SizedBox(
                height: 90,
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
