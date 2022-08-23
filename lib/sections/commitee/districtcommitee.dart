import 'package:flutter/material.dart';
import 'package:folio/custom_widgets/customWidgets.dart';
import 'package:folio/provider/themeProvider.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'districtCommiteeDesktop.dart';

// import 'DistrictCommiteeMobile.dart';

class DistrictCommitee extends StatefulWidget {
  @override
  State<DistrictCommitee> createState() => _DistrictCommiteeState();
}

class _DistrictCommiteeState extends State<DistrictCommitee> {
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
          mobile: DistrictCommiteeDesktop(
            isMobile: true,
          ),
          tablet: DistrictCommiteeDesktop(
            isMobile: false,
          ),
          desktop: DistrictCommiteeDesktop(
            isMobile: false,
          ),
        ));
  }
}
