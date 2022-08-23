import 'package:json_annotation/json_annotation.dart';

part 'joining_model.g.dart';

// msgtypes = [text,video,voice,file,image]

@JsonSerializable()
class JoiningModel {
  final String joiningId;
  final String fullName;
  final String? fathersName;
  final String? husbandWifeName;
  final String? subcaste;
  final String? gotra;
  final String? fdobh;
  final String? dobw;
  final String? dom;
  final String? work;
  final String district;
  final String state;
  final int pincode;
  final String address;
  final String phoneResidence;
  final String? phoneOffice;
  final String? emailId;
  final String? joiningdate;
  final String? sign;
  final int submittedAt;
  final int? updatedAt;
  final bool isApproved;
  final String joiningBy;
  final String enrollAs;
  final double amount;
  final String? cashDraftNo;
  final String? bankDated;
  final bool isPaymentReceived;

  JoiningModel({
    required this.joiningId,
    required this.fullName,
    this.fathersName,
    this.husbandWifeName,
    this.subcaste,
    this.gotra,
    this.fdobh,
    this.dobw,
    this.dom,
    this.work,
    required this.district,
    required this.state,
    required this.pincode,
    required this.address,
    required this.phoneResidence,
    this.phoneOffice,
    this.emailId,
    this.joiningdate,
    this.sign,
    required this.submittedAt,
    this.updatedAt,
    this.isApproved = false,
    this.joiningBy = 'website',
    required this.enrollAs,
    this.amount = 0,
    this.cashDraftNo,
    this.bankDated,
    this.isPaymentReceived = false,
  });

  factory JoiningModel.fromJson(Map<String, dynamic> json) =>
      _$JoiningModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoiningModelToJson(this);
}
