import 'package:flutter/material.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/custom_widgets/customWidgets.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/contact/contactDesktop.dart';
import 'package:folio/sections/contact/contactMobile.dart';
import 'package:folio/sections/navBar/navBarLogo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'commiteeDesktop.dart';
import 'commiteeMobile.dart';

class Commitee extends StatefulWidget {
  @override
  State<Commitee> createState() => _CommiteeState();
}

class _CommiteeState extends State<Commitee> {
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
          mobile: CommiteeMobileTab(),
          tablet: CommiteeMobileTab(),
          desktop: CommiteeDesktop(),
        ));
  }
}
