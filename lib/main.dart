import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/provider/themeStyles.dart';
import 'package:folio/sections/aboutus/aboutus.dart';
import 'package:folio/sections/commitee/commitee.dart';
import 'package:folio/sections/commitee/sansad.dart';
import 'package:folio/sections/commitee/sansad_commitee.dart';
import 'package:folio/sections/commitee/statecommitee.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/gallary/gallary.dart';
import 'package:folio/sections/getInTouch/getInTouch.dart';
import 'package:folio/sections/joinus/joinus.dart';
import 'package:folio/sections/mainSection.dart';
import 'package:folio/sections/media/media.dart';
import 'package:folio/sections/news/news.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'sections/commitee/districtcommitee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "aivfenv.env");
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: dotenv.env['APIKEY']!,
          authDomain: dotenv.env['AUTHDOMAIN']!,
          projectId: dotenv.env['PROJECTID']!,
          storageBucket: dotenv.env['STORAGEBUCKET']!,
          messagingSenderId: dotenv.env['MESSAGINGSENDERID']!,
          appId: dotenv.env['APPID']!));

  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider _themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    _themeProvider.lightTheme = await _themeProvider.darkThemePref.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'All India Vaish Federation U.P.',
        theme: ThemeStyles.themeData(_themeProvider.lightTheme, context),
        initialRoute: "/",
        routes: {
          "/": (context) => MainPage(),
          "/workTogether": (context) => GetInTouch(),
          "/commitee": (context) => Commitee(),
          "/joinus": (context) => JoinUs(),
          "/contactUs": (context) => Contact(),
          "/aboutus": (context) => AboutUs(),
          "/gallary": (context) => Gallary(),
          "/media": (context) => MediaGallary(),
          "/news": (context) => News(),
          "/statecommitee": (context) => StateCommitee(),
          "/districtcommitee": (context) => DistrictCommitee(),
          "/vaishmp": (context) => SansadCommitee(),
        },
      ),
    );
  }
}
