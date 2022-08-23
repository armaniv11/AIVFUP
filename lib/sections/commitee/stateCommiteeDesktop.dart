import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/custom_widgets/custom_widget_animator.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/commitee/commitee_table.dart';
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

class StateCommiteeDesktop extends StatefulWidget {
  @override
  State<StateCommiteeDesktop> createState() => _StateCommiteeDesktopState();
}

class _StateCommiteeDesktopState extends State<StateCommiteeDesktop> {
  bool isHovered = false;
  bool isReadMoreOn = false;
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  // List specialInvitations = [
  //   ['श्री राजेन्द्र अग्रवाल', 'मेरठ ', 'प्रदेश महामंत्री', '9761442440'],

  // ];

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
                  text: "\nप्रदेश पदाधिकारी ",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.memb,
              ),
              SizedBox(
                height: 100,
              ),

              Center(
                child: CustomSectionHeading(
                  text: "\nप्रदेश कार्यसमिति सदस्य",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.karyasamiti,
              ),
              SizedBox(
                height: 100,
              ),

              Center(
                child: CustomSectionHeading(
                  text: "\nइकाई एवम मंडल प्रभारी ",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.mandalPrabhari,
                headings: AppConstants.headingsMandal,
              ),

              SizedBox(
                height: 100,
              ),

              Center(
                child: CustomSectionHeading(
                  text: "\nमहिला इकाई पदाधिकारी",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.mahilaSamiti,
              ),
              SizedBox(
                height: 100,
              ),

              Center(
                child: CustomSectionHeading(
                  text: "\nयुवा इकाई पदाधिकारी",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.yuvaSamiti,
              ),

              SizedBox(
                height: 100,
              ),

              Center(
                child: CustomSectionHeading(
                  text: "\nप्रदेश कार्यसमिति सदस्य (विशेष आमंत्रित)",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(members: AppConstants.vishesh),
              SizedBox(
                height: 100,
              ),

              Center(
                child: CustomSectionHeading(
                  text: "\nवैश्य जागृति ई- मैगजीन",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable(
                members: AppConstants.magazineList,
              ),
              SizedBox(
                height: 100,
              ),
              // Center(
              //   child: Wrap(
              //     children: [
              //       Center(
              //         child: CustomWidgetAnimator(
              //             height: height,
              //             width: width * 1.6,
              //             imageName: 'assets/images/commitee5.jpg'),
              //       ),
              //       Center(
              //         child: CustomWidgetAnimator(
              //             height: height,
              //             width: width * 1.6,
              //             imageName: 'assets/images/commitee3.jpg'),
              //       ),
              //       Center(
              //         child: CustomWidgetAnimator(
              //             height: height,
              //             width: width * 1.6,
              //             imageName: 'assets/images/commitee4.jpg'),
              //       ),
              //       Center(
              //         child: CustomWidgetAnimator(
              //             height: height,
              //             width: width * 1.6,
              //             imageName: 'assets/images/commitee1.jpg'),
              //       ),
              //     ],
              //   ),
              // ),
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
