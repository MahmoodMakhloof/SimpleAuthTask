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
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
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

DrugResponse _$DrugResponseFromJson(Map<String, dynamic> json) => DrugResponse(
      json['name'] as String?,
      json['dose'] as String?,
      json['strength'] as String?,
    );

Map<String, dynamic> _$DrugResponseToJson(DrugResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dose': instance.dose,
      'strength': instance.strength,
    };

MedicationClassResponse _$MedicationClassResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationClassResponse(
      (json['associatedDrug'] as List<dynamic>?)
          ?.map((e) => DrugResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['associatedDrug#2'] as List<dynamic>?)
          ?.map((e) => DrugResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicationClassResponseToJson(
        MedicationClassResponse instance) =>
    <String, dynamic>{
      'associatedDrug': instance.associatedDrug1,
      'associatedDrug#2': instance.associatedDrug2,
    };

MedicationsClassesResponse _$MedicationsClassesResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsClassesResponse(
      json['className'] == null
          ? null
          : MedicationClassResponse.fromJson(
              json['className'] as Map<String, dynamic>),
      json['className2'] == null
          ? null
          : MedicationClassResponse.fromJson(
              json['className2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedicationsClassesResponseToJson(
        MedicationsClassesResponse instance) =>
    <String, dynamic>{
      'className': instance.class1,
      'className2': instance.class2,
    };

LabResponse _$LabResponseFromJson(Map<String, dynamic> json) => LabResponse(
      json['missing_field'] as String?,
    );

Map<String, dynamic> _$LabResponseToJson(LabResponse instance) =>
    <String, dynamic>{
      'missing_field': instance.missingField,
    };

DiabetesResponse _$DiabetesResponseFromJson(Map<String, dynamic> json) =>
    DiabetesResponse(
      (json['medications'] as List<dynamic>?)
          ?.map((e) =>
              MedicationsClassesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['labs'] as List<dynamic>?)
          ?.map((e) => LabResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiabetesResponseToJson(DiabetesResponse instance) =>
    <String, dynamic>{
      'medications': instance.medications,
      'labs': instance.labs,
    };

ProblemResponse _$ProblemResponseFromJson(Map<String, dynamic> json) =>
    ProblemResponse(
      (json['Diabetes'] as List<dynamic>?)
          ?.map((e) => DiabetesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['Asthma'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProblemResponseToJson(ProblemResponse instance) =>
    <String, dynamic>{
      'Diabetes': instance.diabetes,
      'Asthma': instance.asthma,
    };

ProblemsResponse _$ProblemsResponseFromJson(Map<String, dynamic> json) =>
    ProblemsResponse(
      (json['problems'] as List<dynamic>?)
          ?.map((e) => ProblemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$ProblemsResponseToJson(ProblemsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'problems': instance.problems,
    };
