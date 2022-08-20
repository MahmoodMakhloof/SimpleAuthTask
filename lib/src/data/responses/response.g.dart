// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      status: json['status'] as int?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['_id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      accessToken: json['access_token'] as String?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'access_token': instance.accessToken,
      'user': instance.user,
    };

AssocitiveDrugResponse _$AssocitiveDrugResponseFromJson(
        Map<String, dynamic> json) =>
    AssocitiveDrugResponse(
      json['name'] as String?,
      json['dose'] as String?,
      json['strength'] as String?,
    );

Map<String, dynamic> _$AssocitiveDrugResponseToJson(
        AssocitiveDrugResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dose': instance.dose,
      'strength': instance.strength,
    };

ClassResponse _$ClassResponseFromJson(Map<String, dynamic> json) =>
    ClassResponse(
      (json['associatedDrug'] as List<dynamic>?)
          ?.map(
              (e) => AssocitiveDrugResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['associatedDrug#2'] as List<dynamic>)
          .map(
              (e) => AssocitiveDrugResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassResponseToJson(ClassResponse instance) =>
    <String, dynamic>{
      'associatedDrug': instance.associtiveDrug,
      'associatedDrug#2': instance.associatedDrug2,
    };

MedicationsClassesResponse _$MedicationsClassesResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsClassesResponse(
      (json['className'] as List<dynamic>?)
          ?.map((e) => ClassResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['className2'] as List<dynamic>?)
          ?.map((e) => ClassResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicationsClassesResponseToJson(
        MedicationsClassesResponse instance) =>
    <String, dynamic>{
      'className': instance.class1,
      'className2': instance.class2,
    };

MedicationsResponse _$MedicationsResponseFromJson(Map<String, dynamic> json) =>
    MedicationsResponse(
      (json['medicationsClasses'] as List<dynamic>?)
          ?.map((e) =>
              MedicationsClassesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicationsResponseToJson(
        MedicationsResponse instance) =>
    <String, dynamic>{
      'medicationsClasses': instance.medicationsClasses,
    };

DiabeteResponse _$DiabeteResponseFromJson(Map<String, dynamic> json) =>
    DiabeteResponse(
      (json['medications'] as List<dynamic>?)
          ?.map((e) => MedicationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiabeteResponseToJson(DiabeteResponse instance) =>
    <String, dynamic>{
      'medications': instance.medications,
    };

ProblemResponse _$ProblemResponseFromJson(Map<String, dynamic> json) =>
    ProblemResponse(
      (json['Diabetes'] as List<dynamic>?)
          ?.map((e) => DiabeteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProblemResponseToJson(ProblemResponse instance) =>
    <String, dynamic>{
      'Diabetes': instance.diabetes,
    };

MyDataResponse _$MyDataResponseFromJson(Map<String, dynamic> json) =>
    MyDataResponse(
      (json['problems'] as List<dynamic>?)
          ?.map((e) => ProblemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$MyDataResponseToJson(MyDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'problems': instance.problems,
    };
