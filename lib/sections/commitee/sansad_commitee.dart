import 'package:flutter/material.dart';
import 'package:folio/custom_widgets/customWidgets.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/commitee/sansad.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'districtCommiteeDesktop.dart';

// import 'DistrictCommiteeMobile.dart';

class SansadCommitee extends StatefulWidget {
  @override
  State<SansadCommitee> createState() => _SansadCommiteeState();
}

class _SansadCommiteeState extends State<SansadCommitee> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.orange[50],
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        appBar: MediaQuery.of(context).size.width < 760
            ? AppBarMobile(context: context) as PreferredSizeWidget?
            : AppBarTabDesktop(context: context) as PreferredSizeWidget?,
        body: ScreenTypeLayout(
          mobile: SansadDesktop(
            isMobile: true,
          ),
          tablet: SansadDesktop(
            isMobile: false,
          ),
          desktop: SansadDesktop(
            isMobile: false,
          ),
        ));
  }
}
