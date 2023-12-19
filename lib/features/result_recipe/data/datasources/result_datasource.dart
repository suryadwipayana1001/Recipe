import 'package:dio/dio.dart';
import '../models/result_model.dart';

abstract class ResultDatasource {
  Future<ResultModel> getResult(Map<String, dynamic> data);
}

class ResultDataSourceImplementation implements ResultDatasource {
  final Dio dio;
  ResultDataSourceImplementation({required this.dio});

  Future<ResultModel> getResult(Map<String, dynamic> data) async {
    String path = "resep-makanan";
    try {
      final response = await dio.post(path, data: data);
      return ResultModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
