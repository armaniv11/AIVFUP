// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joining_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoiningModel _$JoiningModelFromJson(Map<String, dynamic> json) => JoiningModel(
      joiningId: json['joiningId'] as String,
      fullName: json['fullName'] as String,
      fathersName: json['fathersName'] as String?,
      husbandWifeName: json['husbandWifeName'] as String?,
      subcaste: json['subcaste'] as String?,
      gotra: json['gotra'] as String?,
      fdobh: json['fdobh'] as String?,
      dobw: json['dobw'] as String?,
      dom: json['dom'] as String?,
      work: json['work'] as String?,
      district: json['district'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as int,
      address: json['address'] as String,
      phoneResidence: json['phoneResidence'] as String,
      phoneOffice: json['phoneOffice'] as String?,
      emailId: json['emailId'] as String?,
      joiningdate: json['joiningdate'] as String?,
      sign: json['sign'] as String?,
      submittedAt: json['submittedAt'] as int,
      updatedAt: json['updatedAt'] as int?,
      isApproved: json['isApproved'] as bool? ?? false,
      joiningBy: json['joiningBy'] as String? ?? 'website',
      enrollAs: json['enrollAs'] as String,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      cashDraftNo: json['cashDraftNo'] as String?,
      bankDated: json['bankDated'] as String?,
      isPaymentReceived: json['isPaymentReceived'] as bool? ?? false,
    );

Map<String, dynamic> _$JoiningModelToJson(JoiningModel instance) =>
    <String, dynamic>{
      'joiningId': instance.joiningId,
      'fullName': instance.fullName,
      'fathersName': instance.fathersName,
      'husbandWifeName': instance.husbandWifeName,
      'subcaste': instance.subcaste,
      'gotra': instance.gotra,
      'fdobh': instance.fdobh,
      'dobw': instance.dobw,
      'dom': instance.dom,
      'work': instance.work,
      'district': instance.district,
      'state': instance.state,
      'pincode': instance.pincode,
      'address': instance.address,
      'phoneResidence': instance.phoneResidence,
      'phoneOffice': instance.phoneOffice,
      'emailId': instance.emailId,
      'joiningdate': instance.joiningdate,
      'sign': instance.sign,
      'submittedAt': instance.submittedAt,
      'updatedAt': instance.updatedAt,
      'isApproved': instance.isApproved,
      'joiningBy': instance.joiningBy,
      'enrollAs': instance.enrollAs,
      'amount': instance.amount,
      'cashDraftNo': instance.cashDraftNo,
      'bankDated': instance.bankDated,
      'isPaymentReceived': instance.isPaymentReceived,
    };
