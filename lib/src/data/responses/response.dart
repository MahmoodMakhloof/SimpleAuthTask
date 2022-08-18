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

  UserResponse({this.id, this.fullname, this.email, this.username});
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
class DrugResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "dose")
  String? dose;
  @JsonKey(name: "strength")
  String? strength;

  DrugResponse(this.name,this.dose,this.strength);
  // from json
  factory DrugResponse.fromJson(Map<String, dynamic> json) =>
      _$DrugResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DrugResponseToJson(this);
}

@JsonSerializable()
class MedicationClassResponse {
  @JsonKey(name: "associatedDrug")
  List<DrugResponse>? associatedDrug1;
  @JsonKey(name: "associatedDrug#2")
  List<DrugResponse>? associatedDrug2;

  MedicationClassResponse(this.associatedDrug1,this.associatedDrug2,);
  // from json
  factory MedicationClassResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationClassResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$MedicationClassResponseToJson(this);
}


@JsonSerializable()
class MedicationsClassesResponse {
  @JsonKey(name: "className")
  MedicationClassResponse? class1;
  @JsonKey(name: "className2")
  MedicationClassResponse? class2;
  
  MedicationsClassesResponse(this.class1,this.class2);
  // from json
  factory MedicationsClassesResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsClassesResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$MedicationsClassesResponseToJson(this);
}

@JsonSerializable()
class LabResponse {
  @JsonKey(name:"missing_field")
  String? missingField;

  LabResponse(this.missingField);

  // from json
  factory LabResponse.fromJson(Map<String, dynamic> json) =>
      _$LabResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$LabResponseToJson(this);

}
@JsonSerializable()
class DiabetesResponse {
  @JsonKey(name: "medications")
  List<MedicationsClassesResponse>? medications;
  @JsonKey(name: "labs")
  List<LabResponse>? labs;

  DiabetesResponse(this.medications,this.labs,);
  // from json
  factory DiabetesResponse.fromJson(Map<String, dynamic> json) =>
      _$DiabetesResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DiabetesResponseToJson(this);
}

@JsonSerializable()
class ProblemResponse {
  @JsonKey(name: "Diabetes")
  List<DiabetesResponse>? diabetes;
  @JsonKey(name: "Asthma")
  List? asthma;

  ProblemResponse(this.diabetes,this.asthma,);
  // from json
  factory ProblemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProblemResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ProblemResponseToJson(this);
}

@JsonSerializable()
class ProblemsResponse extends BaseResponse{
  @JsonKey(name: "problems")
  List<ProblemResponse>? problems;
  

  ProblemsResponse(this.problems,);
  // from json
  factory ProblemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProblemsResponseFromJson(json);
  // to json
  @override
  Map<String, dynamic> toJson() => _$ProblemsResponseToJson(this);
}

