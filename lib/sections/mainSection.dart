import 'package:fluttertoast/fluttertoast.dart';
import 'package:folio/custom_widgets/customWidgets.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/footer/footersection.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/home/home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ThemeProvider _themeProviders = ThemeProvider();
  bool isPressed = false;
  bool _isScrollingDown = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // _scrollController = _themeProviders.scroll;
    // _scrollController.addListener(() {
    //   if (_scrollController.position.userScrollDirection ==
    //       ScrollDirection.reverse) {
    //     if (!_isScrollingDown) {
    //       _isScrollingDown = true;
    //       setState(() {});
    //     }
    //   }

    //   if (_scrollController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     if (_isScrollingDown) {
    //       _isScrollingDown = false;
    //       setState(() {});
    //     }
    //   }
    // });
    super.initState();
    // Fluttertoast.showToast(
    //     msg: "Website under construction!!",
    //     timeInSecForIosWeb: 4,
    //     webPosition: "center",
    //     webShowClose: true,
    //     gravity: ToastGravity.SNACKBAR);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenu(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[50],
      appBar: MediaQuery.of(context).size.width < 760
          ? AppBarMobile(context: context) as PreferredSizeWidget?
          : AppBarTabDesktop(context: context) as PreferredSizeWidget?,
      // drawer: MediaQuery.of(context).size.width < 760
      //     ? _appBarMobile(_themeProv,context)
      //     : null,
      body: ListView(
        children: [
          HomePage(),
          About(),
          // Services(),
          // Portfolio(),
          // Contact(),
          FooterSection()
          // SectionsBody(
          //   scrollController: _scrollController,
          //   sectionsLength: _sectionsIcons.length,
          //   sectionWidget: sectionWidget,
          // ),
          // _isScrollingDown
          //     ? Positioned(
          //         bottom: 90,
          //         right: 0,
          //         child: EntranceFader(
          //             offset: Offset(0, 20),
          //             child: ArrowOnTop(
          //               onPressed: () => _scroll(0),
          //             )))
          //     : Container()
        ],
      ),
    );
  }
}

class SectionsBody extends StatelessWidget {
  final ScrollController? scrollController;
  final int? sectionsLength;
  final Widget Function(int)? sectionWidget;

  const SectionsBody({
    Key? key,
    this.scrollController,
    this.sectionsLength,
    this.sectionWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        // physics: !kIsWeb ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        controller: scrollController,
        itemCount: sectionsLength,
        itemBuilder: (context, index) => sectionWidget!(index),
      ),
    );
  }
}

// onPointerSignal: (ps) {
//           if (ps is PointerScrollEvent) {
//             final newOffset = scrollController.offset + ps.scrollDelta.dy;
//             if (ps.scrollDelta.dy.isNegative) {
//               scrollController.jumpTo(math.max(0, newOffset));
//             } else {
//               scrollController.jumpTo(math.min(
//                   scrollController.position.maxScrollExtent, newOffset));
//             }
//           }
//         },