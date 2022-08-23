import 'package:flutter/material.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/custom_widgets/customWidgets.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/aboutus/aboutDesktop.dart';
import 'package:folio/sections/aboutus/aboutMobile.dart';
import 'package:folio/sections/contact/contactDesktop.dart';
import 'package:folio/sections/contact/contactMobile.dart';
import 'package:folio/sections/navBar/navBarLogo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Widget _appBarTabDesktop(ThemeProvider _themeProv) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                height: 20.0,
              ))
          : EntranceFader(
              offset: Offset(0, -10),
              duration: Duration(milliseconds: 250),
              delay: Duration(milliseconds: 100),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        // for (int i = 0; i < _sectionsName.length; i++)
        //   _appBarActions(_sectionsName[i], i, _sectionsIcons[i], _themeProv),
        EntranceFader(
          offset: Offset(0, -10),
          delay: Duration(milliseconds: 100),
          duration: Duration(milliseconds: 250),
          child: Container(
            height: 60.0,
            width: 120.0,
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                Navigator.pushNamed(context, '/workTogether');
              },
              child: Text(
                "About Us",
                style: GoogleFonts.montserrat(
                  color: _themeProv.lightTheme ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 30.0,
          child: Switch(
            inactiveTrackColor: Colors.grey,
            value: !_themeProv.lightTheme,
            onChanged: (value) {
              _themeProv.lightTheme = !value;
            },
            activeColor: kPrimaryColor,
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _appBarMobile(ThemeProvider theme) {
    return Drawer(
      child: Material(
        color: theme.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: kPrimaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: theme.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !theme.lightTheme,
                  onChanged: (value) {
                    theme.lightTheme = !value;
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              // for (int i = 0; i < _sectionsName.length; i++)
              //   _appBarActions(_sectionsName[i], i, _sectionsIcons[i], theme),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: kPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: kPrimaryColor)),
                  onPressed: () {
                    launchURL(
                        "https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing");
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "RESUME",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: theme.lightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          mobile: AboutUsDesktop(
            isMobile: true,
          ),
          tablet: AboutUsDesktop(),
          desktop: AboutUsDesktop(),
        ));
  }
}
