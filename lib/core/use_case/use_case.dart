import 'package:example_clean/core/failure/failure.dart';
import 'package:example_clean/core/result/result.dart';

abstract class UseCaseWithParams<SuccessType, Params> {
  Future<Result<SuccessType, Failure>> call(Params params);
}

abstract class UseCase<SuccessType> {
  Future<Result<SuccessType, Failure>> call();
}
