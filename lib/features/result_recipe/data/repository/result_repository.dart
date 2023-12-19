import 'package:dio/dio.dart';
import '../../../../core/core.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/result_datasource.dart';
import '../models/result_model.dart';

abstract class ResultRepository {
  Future<Either<Failure, ResultModel>> getResult(Map<String, dynamic> data);
}

class ResultRepositorImplementation implements ResultRepository {
  final ResultDatasource dataSource;
  final NetworkInfo networkInfo;

  ResultRepositorImplementation(
      {required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, ResultModel>> getResult(
      Map<String, dynamic> data) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dataSource.getResult(data);
        return Right(response);
      } on DioError catch (e) {
        return Left(
          ServerFailure(message: e.response!.data),
        );
      }
    }
    return const Left(ServerFailure());
  }
}
