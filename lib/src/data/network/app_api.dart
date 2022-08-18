import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

import '../../../core/constants.dart';

import '../responses/response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  //* Authentication
  @POST("login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  //* Problems
  @GET("problems")
  Future<ProblemsResponse>getProblems();
}
