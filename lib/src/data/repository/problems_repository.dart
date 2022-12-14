
import 'package:simple_auth/src/data/network/app_api.dart';
import 'package:simple_auth/src/data/network/error_handler.dart';
import 'package:simple_auth/src/data/network/failure.dart';
import 'package:simple_auth/src/data/responses/response.dart';
import 'package:dartz/dartz.dart';

import '../network/network_info.dart';

class ProblemsRepository {
  final NetworkInfo _networkInfo;
  final AppServiceClient _appServiceClient;

  ProblemsRepository(this._networkInfo, this._appServiceClient);
  Future<Either<Failure, MyDataResponse>> getProblems()async {
    if (await _networkInfo.isConnected) {
      try {
        // safe to call APIs
        final response = await _appServiceClient.getProblems();
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return data
          // return right

          return Right(response);
        } else {
          // return biz logic error
          // return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.msg ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}