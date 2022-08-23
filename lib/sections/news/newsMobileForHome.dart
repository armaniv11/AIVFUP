import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/apis/firebase_api.dart';
import 'package:folio/constants.dart';
import 'package:folio/models/news_model.dart';
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

class NewsMobileForHome extends StatefulWidget {
  @override
  State<NewsMobileForHome> createState() => _NewsMobileForHomeState();
}

class _NewsMobileForHomeState extends State<NewsMobileForHome> {
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
    await FirebaseApi.loadCollection('News').then((result) {
      allNews = result.docs
          .map((e) => NewsModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      setState(() {
        isLoading = false;
      });
    });
  }

  bool isLoading = true;

  List<NewsModel> allNews = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            SizedBox(
              height: 30,
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(allNews.length, (index) {
                          return WidgetAnimator(
                            child: ImageItemExtended(
                              news: allNews[index],
                            ),
                          );
                        })),
                  ),
          ],
        ),
      ),
    );
  }
}
// }

class ImageItemExtended extends StatelessWidget {
  final NewsModel news;
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
                                        image: NetworkImage(news.imgurl))),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news.title,
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
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
          width: size.width,
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 6, left: 8, right: 8, top: 6),
            child: Text(
              news.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                  fontSize: 12,
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
      ),
    );
  }
}
