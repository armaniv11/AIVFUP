import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/apis/firebase_api.dart';
import 'package:folio/constants.dart';
import 'package:folio/custom_classes/custom_dropdown.dart';
import 'package:folio/custom_classes/custom_textformfield.dart';
import 'package:folio/models/joining_model.dart';
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

import 'package:random_string/random_string.dart';

class JoinUsDesktop extends StatefulWidget {
  @override
  State<JoinUsDesktop> createState() => _JoinUsDesktopState();
}

class _JoinUsDesktopState extends State<JoinUsDesktop> {
  TextEditingController rupeeController = TextEditingController();
  TextEditingController cashDraftController = TextEditingController();
  TextEditingController ofController = TextEditingController();
  TextEditingController bankDatedController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherController = TextEditingController();
  TextEditingController husbandWifeController = TextEditingController();
  TextEditingController subcasteController = TextEditingController();
  TextEditingController gotraController = TextEditingController();
  TextEditingController dobhController = TextEditingController();
  TextEditingController dobwController = TextEditingController();
  TextEditingController domController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController phoneRController = TextEditingController();
  TextEditingController phoneOController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController signController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool isHovered = false;
  bool isReadMoreOn = false;
  bool isLoading = false;

  final List<String> membershipOption = [
    'Chief Patron',
    'Patron',
    'Associate Member',
    'Lifetime Membership'
  ];
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  String? selectedMember;

  bool termsAccepted = false;

  int value = 0;

  void selectMemberType(String selected) {
    setState(() {
      selectedMember = selected;
    });
    // print(subCategoryMenu);
  }

  Widget CustomRadioButton(String text, int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 12),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              value = index;
            });
          },
          child: Text(
            text,
            style: TextStyle(
              color: (value == index) ? Colors.green : Colors.black,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   borderSide:
          //       BorderSide(color: (value == index) ? Colors.black : Colors.yellow),
          // ),
        ));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomSectionHeading(
                    text: "\nJoin Us",
                  ),
                ),
                // CustomSectionSubHeading(
                //     text: "Let's build something together :)\n\n"),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: AdaptiveText(
                        "Application Form - A for Individual Membership",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 120),
                  child: Center(
                    child: Container(
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AdaptiveText(
                              "To,",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 4, bottom: 4),
                              child: AdaptiveText(
                                "All India Vaish Federation,",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: AdaptiveText(
                                "396, Lower Tank Bund, Hyderabad-500080 TS",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            // AdaptiveText(
                            //   "Sir,",
                            //   style: GoogleFonts.montserrat(
                            //       textStyle: TextStyle(
                            //           fontWeight: FontWeight.w600,
                            //           color: Colors.black)),
                            // ),
                            Center(
                              child: Wrap(
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 20, right: 10, top: 22, bottom: 16),
                                  //   child:
                                  //       AdaptiveText("I wish to be enrolled as "),
                                  // ),
                                  CustomDropDown(
                                      width: width / 5.75,
                                      heading: "Enroll as",
                                      items: membershipOption,
                                      callBack: selectMemberType,
                                      selected: selectedMember),

                                  CustomTextFormField(
                                    controller: rupeeController,
                                    hintText: "Amount (in rs.)",
                                    width: width / 6,
                                    validationEnabled: true,
                                  ),

                                  CustomTextFormField(
                                    controller: cashDraftController,
                                    hintText: "Cash / Draft No.",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: bankDatedController,
                                    hintText: "Bank Dated",
                                    width: width / 6,
                                  ),
                                ],
                              ),
                            ),
                            // Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 60, bottom: 30),
                              child: Center(
                                  child: AdaptiveText(
                                " DETAILS",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.red[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              )),
                            ),
                            Center(
                              child: Wrap(
                                children: [
                                  CustomTextFormField(
                                    controller: nameController,
                                    hintText: "Full Name",
                                    width: width / 6,
                                    validationEnabled: true,
                                  ),
                                  CustomTextFormField(
                                    controller: fatherController,
                                    hintText: "Father's Name",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: husbandWifeController,
                                    hintText: "Name of Husband / Wife",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: subcasteController,
                                    hintText: "Sub Caste",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: gotraController,
                                    hintText: "Gotra",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: domController,
                                    hintText: "Date of Marriage",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: workController,
                                    hintText: "Work / Profession",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: dobhController,
                                    hintText: "Date of Birth",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: districtController,
                                    hintText: "District",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: stateController,
                                    hintText: "State",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: pincodeController,
                                    hintText: "Pincode",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: emailController,
                                    hintText: "Email ID",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: addressController,
                                    hintText: "Permanent Residential Address",
                                    width: width * 0.725,
                                  ),
                                  CustomTextFormField(
                                    controller: phoneRController,
                                    hintText: "Phone (Residence)",
                                    width: width / 6,
                                  ),
                                  CustomTextFormField(
                                    controller: phoneOController,
                                    hintText: "Phone (Office)",
                                    width: width / 6,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: termsAccepted,
                                      onChanged: (val) {
                                        setState(() {
                                          termsAccepted = !termsAccepted;
                                        });
                                        print(termsAccepted);
                                        print(val);
                                      }),
                                  Expanded(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 22, bottom: 16),
                                        child: AdaptiveText(
                                            " I Agree to abide  by the rules and objects of the federation and assure you my full and sincere co-operation in acheiving the goal set out by the deferation. "),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            termsAccepted
                                ? SizedBox()
                                : Text(
                                    "Please accept the terms and conditions!!",
                                    style: TextStyle(color: Colors.red),
                                  ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Column(
                            //         children: [
                            //           Padding(
                            //             padding: const EdgeInsets.only(top: 14),
                            //             child: AdaptiveText(
                            //               " Date ",
                            //               style: TextStyle(
                            //                   fontWeight: FontWeight.w700),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding: const EdgeInsets.only(top: 2),
                            //             child: Container(
                            //               width: 140,
                            //               child: TextFormField(
                            //                 controller: dateController,
                            //                 decoration: InputDecoration(
                            //                   isDense: true,
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         children: [
                            //           Padding(
                            //             padding: const EdgeInsets.only(top: 14),
                            //             child: AdaptiveText(
                            //               " Signature ",
                            //               style: TextStyle(
                            //                   fontWeight: FontWeight.w700),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding: const EdgeInsets.only(top: 2),
                            //             child: Container(
                            //               width: 140,
                            //               child: TextFormField(
                            //                 controller: signController,
                            //                 decoration: InputDecoration(
                            //                   isDense: true,
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            Divider(
                              color: Colors.blue[800],
                              height: 40,
                              thickness: 6,
                            ),
                            AdaptiveText(
                              'Note:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4, bottom: 10),
                              child: Row(
                                children: [
                                  AdaptiveText("1."),
                                  Expanded(
                                    child: AdaptiveText(
                                        "Membership fee must be sent by cash or by bank draft in favour of 'All India Vaish Federation' payable at New Delhi only alongwith two Copies of Passport Size Photograph "),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4, bottom: 10),
                              child: AdaptiveText(
                                  "2. Payment made to Federation is exempted under Income Tax act 1961 under Section 80-G."),
                            ),
                            // size.width <width
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    AdaptiveText(
                                      "CHIEF PATRON",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AdaptiveText("Rs. 2,01,000/-"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    AdaptiveText(
                                      "PATRON",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AdaptiveText("Rs. 1,01,000/-"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    AdaptiveText(
                                      "ASSOCIATE MEMBER",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AdaptiveText("Rs. 21,000/-"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    AdaptiveText(
                                      "LIFE MEMBERSHIP",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AdaptiveText("Rs. 1,100/-"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.blue[800],
                              height: 40,
                              thickness: 6,
                            ),

                            Center(
                              child: InkWell(
                                hoverColor: Colors.grey,
                                onTap: submitForm,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  color: Colors.green,
                                  child: isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Text(
                                          "SUBMIT FORM",
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                ),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      print("e");
      setState(() {
        isLoading = true;
      });
      final joiningUploadModel = JoiningModel(
          joiningId: randomAlphaNumeric(6),
          fullName: nameController.text,
          fathersName: fatherController.text,
          husbandWifeName: husbandWifeController.text,
          subcaste: subcasteController.text,
          gotra: gotraController.text,
          fdobh: dobhController.text,
          dobw: dobwController.text,
          dom: domController.text,
          work: workController.text,
          phoneOffice: phoneOController.text,
          emailId: emailController.text,
          joiningdate: dateController.text,
          sign: signController.text,
          district: districtController.text,
          state: stateController.text,
          pincode: int.tryParse(pincodeController.text) ?? 0,
          amount: double.tryParse(rupeeController.text) ?? 0.0,
          cashDraftNo: cashDraftController.text,
          bankDated: bankDatedController.text,
          address: addressController.text,
          phoneResidence: phoneRController.text,
          submittedAt: DateTime.now().millisecondsSinceEpoch,
          enrollAs: selectedMember!);
      await FirebaseApi.upsertDocToCollection(
              doc: joiningUploadModel.joiningId,
              collection: "Joining",
              modelToUpload: joiningUploadModel)
          .then((value) {
        if (value) {
          _formKey.currentState!.save();
          print("success");
          Fluttertoast.showToast(
              msg: "Joining form has been submitted sucessfully!!");
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
