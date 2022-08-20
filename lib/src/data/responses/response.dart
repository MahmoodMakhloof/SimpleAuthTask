import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "msg")
  String? msg;
  BaseResponse({this.status, this.msg});
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "fullname")
  String? fullname;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "avatar")
  String? avatar;

  UserResponse({this.id, this.fullname, this.email, this.username,this.avatar});
  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "user")
  UserResponse? user;

  AuthenticationResponse({this.accessToken, this.user,});
  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to json
  @override
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class AssocitiveDrugResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "dose")
  String? dose;
  @JsonKey(name: "strength")
  String? strength;

  AssocitiveDrugResponse(this.name,this.dose,this.strength);
  // from json
  factory AssocitiveDrugResponse.fromJson(Map<String, dynamic> json) =>
      _$AssocitiveDrugResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AssocitiveDrugResponseToJson(this);
}



@JsonSerializable()
class ClassResponse {
  @JsonKey(name: "associatedDrug")
  List<AssocitiveDrugResponse>? associtiveDrug;
  @JsonKey(name: "associatedDrug#2")
  List<AssocitiveDrugResponse>  associatedDrug2;
  
  ClassResponse(this.associtiveDrug,this.associatedDrug2);
  // from json
  factory ClassResponse.fromJson(Map<String, dynamic> json) =>
      _$ClassResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ClassResponseToJson(this);
}

@JsonSerializable()
class MedicationsClassesResponse {
  @JsonKey(name: "className")
  List<ClassResponse>? class1;
  @JsonKey(name: "className2")
  List<ClassResponse>? class2;
  
  MedicationsClassesResponse(this.class1,this.class2);
  // from json
  factory MedicationsClassesResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsClassesResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$MedicationsClassesResponseToJson(this);
}



@JsonSerializable()
class MedicationsResponse {
  @JsonKey(name: "medicationsClasses")
  List<MedicationsClassesResponse>? medicationsClasses;
  MedicationsResponse(this.medicationsClasses,);
  // from json
  factory MedicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$MedicationsResponseToJson(this);
}




@JsonSerializable()
class DiabeteResponse {
  @JsonKey(name: "medications")
  List<MedicationsResponse>? medications;

  DiabeteResponse(this.medications,);
  // from json
  factory DiabeteResponse.fromJson(Map<String, dynamic> json) =>
      _$DiabeteResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DiabeteResponseToJson(this);
}


@JsonSerializable()
class ProblemResponse {
  @JsonKey(name: "Diabetes")
  List<DiabeteResponse>? diabetes;
  
  ProblemResponse(this.diabetes,);
  // from json
  factory ProblemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProblemResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ProblemResponseToJson(this);
}

@JsonSerializable()
class MyDataResponse extends BaseResponse{
  @JsonKey(name: "problems")
  List<ProblemResponse>? problems;
  

  MyDataResponse(this.problems,);
  // from json
  factory MyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MyDataResponseFromJson(json);
  // to json
  @override
  Map<String, dynamic> toJson() => _$MyDataResponseToJson(this);
}

