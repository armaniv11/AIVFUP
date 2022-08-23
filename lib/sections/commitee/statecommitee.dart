import 'package:flutter/material.dart';
import 'package:folio/custom_widgets/customWidgets.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/commitee/stateCommiteeDesktop.dart';
import 'package:folio/sections/commitee/stateCommiteeMobile.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

// import 'StateCommiteeMobile.dart';

class StateCommitee extends StatefulWidget {
  @override
  State<StateCommitee> createState() => _StateCommiteeState();
}

class _StateCommiteeState extends State<StateCommitee> {
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
          mobile: StateCommiteeMobile(),
          tablet: StateCommiteeDesktop(),
          desktop: StateCommiteeDesktop(),
        ));
  }
}
