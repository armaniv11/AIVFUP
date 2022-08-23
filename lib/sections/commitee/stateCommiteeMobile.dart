import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/custom_widgets/custom_widget_animator.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/commitee/commitee_table.dart';
import 'package:folio/sections/footer/footersection.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:provider/provider.dart';

class StateCommiteeMobile extends StatefulWidget {
  @override
  State<StateCommiteeMobile> createState() => _StateCommiteeMobileState();
}

class _StateCommiteeMobileState extends State<StateCommiteeMobile> {
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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomSectionHeading(
                text: "प्रदेश पदाधिकारी ",
              ),
            ),
            // CustomSectionSubHeading(
            //     text: "Let's build something together :)\n\n"),
            SizedBox(
              height: 100,
            ),
            CommiteeTable(
              members: AppConstants.memb,
              isMobile: true,
            ),
            SizedBox(
              height: 100,
            ),

            Center(
              child: CustomSectionHeading(
                text: "प्रदेश कार्यसमिति सदस्य",
                isMobile: true,
              ),
            ),
            // CustomSectionSubHeading(
            //     text: "Let's build something together :)\n\n"),
            SizedBox(
              height: 40,
            ),
            CommiteeTable(
              members: AppConstants.karyasamiti,
              isMobile: true,
            ),
            SizedBox(
              height: 100,
            ),

            Center(
              child: CustomSectionHeading(
                text: "इकाई एवम मंडल प्रभारी ",
                isMobile: true,
              ),
            ),
            // CustomSectionSubHeading(
            //     text: "Let's build something together :)\n\n"),
            SizedBox(
              height: 40,
            ),
            CommiteeTable(
              members: AppConstants.mandalPrabhari,
              headings: AppConstants.headingsMandal,
              isMobile: true,
            ),

            SizedBox(
              height: 100,
            ),

            Center(
              child: CustomSectionHeading(
                text: "महिला इकाई पदाधिकारी",
                isMobile: true,
              ),
            ),
            // CustomSectionSubHeading(
            //     text: "Let's build something together :)\n\n"),
            SizedBox(
              height: 40,
            ),
            CommiteeTable(
              members: AppConstants.mahilaSamiti,
              isMobile: true,
            ),
            SizedBox(
              height: 100,
            ),

            Center(
              child: CustomSectionHeading(
                text: "युवा इकाई पदाधिकारी",
                isMobile: true,
              ),
            ),
            // CustomSectionSubHeading(
            //     text: "Let's build something together :)\n\n"),
            SizedBox(
              height: 40,
            ),
            CommiteeTable(
              members: AppConstants.yuvaSamiti,
            ),
            SizedBox(
              height: 100,
            ),

            Center(
              child: CustomSectionHeading(
                text: "प्रदेश कार्यसमिति सदस्य (विशेष आमंत्रित)",
                isMobile: true,
              ),
            ),
            // CustomSectionSubHeading(
            //     text: "Let's build something together :)\n\n"),
            SizedBox(
              height: 100,
            ),
            CommiteeTable(
              members: AppConstants.vishesh,
              isMobile: true,
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
    );
  }
}
