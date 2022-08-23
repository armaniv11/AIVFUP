import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/apis/firebase_api.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/footer/footersection.dart';
import 'package:folio/sections/getInTouch/getInTouchDesktop.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/footer.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class NewsMobile extends StatefulWidget {
  @override
  State<NewsMobile> createState() => _NewsMobileState();
}

class _NewsMobileState extends State<NewsMobile> {
  bool isHovered = false;
  bool isReadMoreOn = false;
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNews();
  }

  Future loadNews() async {
    final result = await FirebaseApi.loadCollection('News');
    result.docs.forEach((element) {
      // print("printing ${element['menuname']}");
      final List<dynamic> news = [];
      news.add(element['imgurl']);
      news.add(element['title']);
      news.add(element['subtitle']);

      allNews.add(news);
      // selectedImages.add(element['images']);
      //   print(menuitems);
    });
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = true;

  List<dynamic> allNews = [];

  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(0, -10, 0);
    final transform = isHovered ? hovered : Matrix4.identity();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomSectionHeading(
                  text: "\nNews",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 30,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: Wrap(
                          children: List.generate(allNews.length, (index) {
                        return WidgetAnimator(
                          child: ImageItemExtended(
                            news: allNews[index],
                          ),
                        );
                      })),
                    ),

              SizedBox(
                height: 60,
              ),
              // Center(child: loadImages()),

              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
// }

class ImageItemExtended extends StatelessWidget {
  final List<dynamic> news;
  const ImageItemExtended({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) => Center(
                  child: Stack(
                    children: [
                      Container(
                        // height: size.height / 2,
                        width: size.width * 0.9,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: size.height * 0.8,
                                width: size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(news[0]))),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news[1],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news[2],
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.close)),
                            )),
                      ),
                    ],
                  ),
                ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: size.height / 1.8,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 2,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1.0,
                        offset: Offset(1.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        news[0],
                      ),
                      fit: BoxFit.fill,
                    )),
                // child: Image.network(imageName),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news[1].toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              // Divider(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 4),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Read More',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
