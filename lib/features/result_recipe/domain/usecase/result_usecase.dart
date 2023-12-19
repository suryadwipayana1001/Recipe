import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../data/repository/result_repository.dart';

abstract class ResultUseCase<Type> {
  Future<Either<Failure, dynamic>> call(Map<String, dynamic> data);
}

class ResultQuestation implements ResultUseCase {
  final ResultRepository repository;
  ResultQuestation(this.repository);

  Future<Either<Failure, dynamic>> call(
    Map<String, dynamic> data,
  ) async {
    return await repository.getResult(data);
  }
}
