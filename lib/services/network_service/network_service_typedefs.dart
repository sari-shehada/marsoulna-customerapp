part of 'network_service.dart';

typedef FutureEither<T> = Future<Either<ErrorResult, SuccessResult<T>>>;
typedef EitherResult<T> = Either<ErrorResult, SuccessResult<T>>;
