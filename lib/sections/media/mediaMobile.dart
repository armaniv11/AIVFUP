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

class MediaGallaryMobile extends StatefulWidget {
  @override
  State<MediaGallaryMobile> createState() => _MediaGallaryMobileState();
}

class _MediaGallaryMobileState extends State<MediaGallaryMobile> {
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
    loadMenus();
  }

  Future loadMenus() async {
    final result = await FirebaseApi.loadCollection('MediaGallary');
    result.docs.forEach((element) {
      // print("printing ${element['menuname']}");
      final Map<String, dynamic> menu = {};
      menu['menuname'] = element['menuname'];
      menu['images'] = element['images'];
      final ii = element['images'];
      ii.forEach((ele) {
        selectedImages.add(ele);
      });

      allImages.add(menu);
      // selectedImages.add(element['images']);
      //   print(menuitems);
    });
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = true;

  List<String> selectedImages = [];

  List<dynamic> allImages = [];

  @override
  Widget build(BuildContext context) {
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
                  text: "\nMedia Gallary",
                ),
              ),
              // CustomSectionSubHeading(
              //     text: "Let's build something together :)\n\n"),
              SizedBox(
                height: 30,
              ),

              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: allImages.length,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MenuItem(
                          itemName: allImages[index]['menuname'],
                          images: allImages[index]['images'],
                        );
                      }),
              // Wrap(
              //     children: List.generate(menuitems.length, (index) {
              //   return WidgetAnimator(
              //     child: MenuItem(
              //       itemName: menuitems[index]['menuname'],
              //     ),
              //   );
              // })),

              SizedBox(
                height: 60,
              ),
              // Center(child: loadImages()),

              FooterSection(),

              // GetInTouchDesktop()
              // const SizedBox(
              //   height: 25.0,
              // ),
              // OutlinedCustomBtn(
              //     btnText: "Let's Work Together",
              //     onPressed: () => Navigator.pushNamed(context, '/workTogether')),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadImages() {
    return Column(
        children: List.generate(selectedImages.length, (index) {
      return WidgetAnimator(
        child: ImageItem(
          imageName: selectedImages[index].toString(),
        ),
      );
    }));
  }
}

class ImageItem extends StatelessWidget {
  final String imageName;
  final bool? isNetworkImage;
  ImageItem({Key? key, required this.imageName, this.isNetworkImage = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) => Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: !isNetworkImage!
                          ? DecorationImage(
                              image: AssetImage('assets/images/$imageName'))
                          : DecorationImage(image: NetworkImage(imageName))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60, top: 60),
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
                ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: isNetworkImage! ? 200 : 400,
          width: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 1.0,
                offset: Offset(1.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            image: isNetworkImage!
                ? DecorationImage(
                    image: NetworkImage(
                      imageName,
                    ),
                    fit: BoxFit.fill,
                  )
                : DecorationImage(
                    image: AssetImage('assets/images/$imageName'),
                    fit: BoxFit.fill),
          ),
          // child: Image.network(imageName),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String itemName;
  final List<dynamic> images;
  const MenuItem({Key? key, required this.itemName, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            // width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.cyan,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4.0,
                  offset: Offset(2.0, 3.0),
                )
              ],
            ),
            // padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                // side: BorderSide(color: kPrimaryColor)
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  itemName,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
              children: List.generate(images.length, (index) {
            return WidgetAnimator(
              child: ImageItem(
                imageName: images[index].toString(),
              ),
            );
          }))
        ],
      ),
    );
  }
}
