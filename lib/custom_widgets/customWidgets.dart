import 'package:flutter/material.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/navBar/navBarLogo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_html/js.dart';

final List<String> _sectionsName = [
  "HOME",
  "ABOUT",
  "GALLARY",
  "JOIN US",
];

final List<IconData> _sectionsIcons = [
  Icons.home,
  Icons.person,
  Icons.settings,
  Icons.build,
  Icons.article,
  Icons.phone,
];

// void _scroll(int i) {
//   _scrollController.animateTo(
//     i == 0
//         ? 0.0
//         : i == 1
//             ? MediaQuery.of(context).size.height * 1.05
//             : i == 2
//                 ? MediaQuery.of(context).size.height * 1.98
//                 : i == 3
//                     ? MediaQuery.of(context).size.height * 2.9
//                     : MediaQuery.of(context).size.height * 4,
//     duration: Duration(seconds: 1),
//     curve: Curves.easeInOut,
//   );
// }

// Widget sectionWidget(int i) {
//   if (i == 0) {
//     return HomePage();
//   } else if (i == 1) {
//     return About();
//   } else if (i == 2) {
//     return Services();
//   } else if (i == 3) {
//     return Portfolio();
//   } else if (i == 4) {
//     return Contact();
//   } else if (i == 5) {
//     return Footer();
//   } else {
//     return Container();
//   }
// }

Widget _appBarActions(
    String childText, int index, IconData icon, BuildContext context, action) {
  return MediaQuery.of(context).size.width > 760
      ? EntranceFader(
          offset: Offset(0, -10),
          delay: Duration(milliseconds: 100),
          duration: Duration(milliseconds: 250),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 90.0,
            child: MaterialButton(
              hoverColor: kPrimaryColor,
              onPressed: () {
                action;
              },
              child: Text(
                childText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            hoverColor: kPrimaryColor.withAlpha(70),
            onPressed: () {
              // _scroll(index);
              Navigator.pop(context);
            },
            child: ListTile(
              leading: Icon(
                icon,
                color: kPrimaryColor,
              ),
              title: Text(childText,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
        );
}

class AppBarTabDesktop extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  const AppBarTabDesktop({Key? key, required this.context})
      : super(
          key: key,
        );

  @override
  State<AppBarTabDesktop> createState() => _AppBarTabDesktopState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarTabDesktopState extends State<AppBarTabDesktop> {
  void handleMenuPressed(String menuName, context) async {
    if (menuName == 'contactus') {
      await Navigator.pushNamed(context, '/contactUs');
    }
    if (menuName == 'home') {
      await Navigator.pushNamed(context, '/');
    }
    if (menuName == 'commitee') {
      await Navigator.pushNamed(context, '/commitee');
    }
    if (menuName == 'statecommitee') {
      await Navigator.pushNamed(context, '/statecommitee');
    }
    if (menuName == 'districtcommitee') {
      await Navigator.pushNamed(context, '/districtcommitee');
    }
    if (menuName == 'aboutus') {
      await Navigator.pushNamed(context, '/aboutus');
    }
    if (menuName == 'gallary') {
      await Navigator.pushNamed(context, '/gallary');
    }
    if (menuName == 'joinus') {
      await Navigator.pushNamed(context, '/joinus');
    }
    if (menuName == 'media') {
      await Navigator.pushNamed(context, '/media');
    }
    if (menuName == 'news') {
      await Navigator.pushNamed(context, '/news');
    }
    if (menuName == 'sansad') {
      await Navigator.pushNamed(context, '/vaishmp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          elevation: 08,
          backgroundColor: Colors.orange[50],
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
            CustomEntranceMenu(
              menuText: 'Home',
              onPressed: () {
                handleMenuPressed('home', context);
              },
            ),
            const SizedBox(width: 3.0),
            CustomEntranceMenu(
              menuText: 'About Us',
              onPressed: () {
                handleMenuPressed('aboutus', context);
              },
            ),
            const SizedBox(width: 3.0),
            // CustomEntranceMenu(
            //   menuText: 'Commitee',
            //   onPressed: () {
            //     print("dropdown clicekd");
            PopupMenuButton(
              color: Colors.transparent,
              child: CustomEntranceMenu(
                menuText: 'Commitee',
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    // value: 1,
                    child: InkWell(
                        onTap: () {},
                        child: CustomEntranceMenu(
                            width: 160,
                            menuText: 'National Commitee',
                            onPressed: () {
                              handleMenuPressed('commitee', context);
                            })),
                  ),
                  PopupMenuItem(
                    // value: quizId,
                    child: InkWell(
                        onTap: () {},
                        child: CustomEntranceMenu(
                            width: 160,
                            menuText: 'State Commitee',
                            onPressed: () {
                              handleMenuPressed('statecommitee', context);
                            })),
                  ),
                  PopupMenuItem(
                    // value: quizId,
                    child: InkWell(
                        onTap: () {},
                        child: CustomEntranceMenu(
                            width: 160,
                            menuText: 'District Commitee',
                            onPressed: () {
                              handleMenuPressed('districtcommitee', context);
                            })),
                  ),
                  PopupMenuItem(
                    // value: quizId,
                    child: InkWell(
                        onTap: () {},
                        child: CustomEntranceMenu(
                            width: 160,
                            menuText: 'Our Vaish M.P.',
                            onPressed: () {
                              handleMenuPressed('sansad', context);
                            })),
                  )
                ];
              },
            ),
            PopupMenuButton(
              color: Colors.transparent,
              child: CustomEntranceMenu(
                menuText: 'Gallary',
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    // value: 1,
                    child: InkWell(
                        onTap: () {},
                        child: CustomEntranceMenu(
                            width: 160,
                            menuText: 'Media Coverage',
                            onPressed: () {
                              handleMenuPressed('media', context);
                            })),
                  ),
                  PopupMenuItem(
                    // value: quizId,
                    child: InkWell(
                        onTap: () {},
                        child: CustomEntranceMenu(
                            width: 160,
                            menuText: 'Events Gallary',
                            onPressed: () {
                              handleMenuPressed('gallary', context);
                            })),
                  )
                ];
              },
            ),
            const SizedBox(width: 3.0),
            // const SizedBox(width: 3.0),
            // CustomEntranceMenu(
            //   menuText: 'Gallary',
            //   onPressed: () {
            //     handleMenuPressed('gallary', context);
            //   },
            // ),
            // const SizedBox(width: 3.0),
            // CustomEntranceMenu(
            //   menuText: 'Media',
            //   onPressed: () {
            //     handleMenuPressed('media', context);
            //   },
            // ),
            // const SizedBox(width: 3.0),
            CustomEntranceMenu(
              menuText: 'News',
              onPressed: () {
                handleMenuPressed('news', context);
              },
            ),
            const SizedBox(width: 3.0),
            CustomEntranceMenu(
              menuText: 'Join Us',
              onPressed: () {
                handleMenuPressed('joinus', context);
              },
            ),
            const SizedBox(width: 3.0),
            CustomEntranceMenu(
              menuText: 'Contact Us',
              onPressed: () {
                handleMenuPressed('contactus', context);
              },
            ),
            const SizedBox(width: 15.0),
          ],
        ));
  }
}

// Widget _appBarTabDesktop(ThemeProvider _themeProv, BuildContext context) {
//   return
// }

class CustomEntranceMenu extends StatelessWidget {
  final String menuText;
  final VoidCallback? onPressed;
  final double? width;
  const CustomEntranceMenu(
      {Key? key, required this.menuText, this.onPressed, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      offset: Offset(0, -10),
      delay: Duration(milliseconds: 100),
      duration: Duration(milliseconds: 250),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          // height: 0.0,
          width: width ?? 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange[50],
            boxShadow: [
              BoxShadow(
                color: Colors.deepOrange,
                // blurRadius: 4.0,
                offset: Offset(1.0, 1.0),
              )
            ],
          ),
          // padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            hoverColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              // side: BorderSide(color: kPrimaryColor)
            ),
            onPressed: onPressed,
            child: Text(
              menuText,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarMobile extends StatefulWidget with PreferredSizeWidget {
  final BuildContext context;

  const AppBarMobile({Key? key, required this.context}) : super(key: key);

  @override
  State<AppBarMobile> createState() => _AppBarMobileState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarMobileState extends State<AppBarMobile> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.orange[50],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/aivflogo.png",
          ),
        ),
        title: Text("All India Vaish Federation",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold))),
        // title: NavBarLogoMobile(
        //     // height: 200,
        //     ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.menu, color: Colors.black),
              ))
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, left: 6),
                  child: NavBarLogo(
                    height: 28,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutus');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "About Us",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/commitee');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    title: Text(
                      "National Committee",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/statecommitee');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    title: Text(
                      "State Committee",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/districtcommitee');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    title: Text(
                      "District Committee",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/vaishmp');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Our Vaish M.P.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/gallary');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.camera_outdoor,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Gallary",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/media');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.mediation,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Media",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.newspaper,
                      color: Colors.white,
                    ),
                    title: Text(
                      "News",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/joinus');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Join Us",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/contactUs');
                  },
                  child: ListTile(
                    tileColor: Colors.orange,
                    leading: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Contact Us",
                      style: TextStyle(color: Colors.white),
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
}

class ResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;
  final bool isRow;
  const ResponsiveRowColumn(
      {Key? key, required this.children, required this.isRow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRow
        ? Row(
            children: children,
          )
        : Column(
            children: children,
          );
  }
}
