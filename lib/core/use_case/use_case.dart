import 'package:store/core/either/either.dart';

import '../failure/failure.dart';

abstract class UseCase<Type, Params> {

  const UseCase();
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}