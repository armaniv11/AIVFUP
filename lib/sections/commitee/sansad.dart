import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/sections/commitee/commiteeTable3Row.dart';
import 'package:folio/sections/footer/footersection.dart';

import 'package:folio/widget/customTextHeading.dart';

import 'commitee_table.dart';

class SansadDesktop extends StatefulWidget {
  final bool isMobile;

  const SansadDesktop({Key? key, required this.isMobile}) : super(key: key);
  @override
  State<SansadDesktop> createState() => _SansadDesktopState();
}

class _SansadDesktopState extends State<SansadDesktop> {
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
                    text: "\nउ.प्र. से हमारे वैश्य सांसद ",
                    isMobile: widget.isMobile),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable3Row(
                members: AppConstants.sansadList,
                isMobile: widget.isMobile,
              ),

              SizedBox(
                height: 90,
              ),

              Center(
                child: CustomSectionHeading(
                    text: "\nउ.प्र. से हमारे वैश्य विधायक",
                    isMobile: widget.isMobile),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 30,
              ),
              CommiteeTable3Row(
                members: AppConstants.mlaList,
                isMobile: widget.isMobile,
              ),

              // SizedBox(
              //   height: 30,
              // ),

              Center(
                child: CustomSectionHeading(
                    text: "\nउ.प्र. से हमारे वैश्य महापौर",
                    isMobile: widget.isMobile),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 100,
              ),
              CommiteeTable3Row(
                members: AppConstants.mayorList,
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
