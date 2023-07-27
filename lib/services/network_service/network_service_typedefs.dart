import 'package:fpdart/fpdart.dart';

import 'helper_models/error_result.dart';
import 'helper_models/success_result.dart';

typedef FutureEither<T> = Future<Either<ErrorResult, SuccessResult<T>>>;
typedef EitherResult<T> = Either<ErrorResult, SuccessResult<T>>;
