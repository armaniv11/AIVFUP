import 'package:flutter/material.dart';
import 'package:folio/sections/about/desktopAbout.dart';
import 'package:folio/sections/about/mobileAbout.dart';
import 'package:folio/widget/footer.dart';

import 'package:responsive_builder/responsive_builder.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: FooterMobile(),
      // tablet: AboutTab(),
      tablet: Footer(),

      desktop: Footer(),
    );
  }
}
