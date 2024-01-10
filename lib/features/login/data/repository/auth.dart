import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/authenticated_user.dart';
import '../../domain/repository/auth.dart';
import '../../presentation/bloc/auth/authentication_bloc.dart';
import '../data_source/remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final dataSource = AuthenticationRemoteDataSource();

  @override
  Future<Either<ServerFailure, AuthenticatedUserEntity>> getUser(
      String username, String password) async {
    try {
      await dataSource.getUser(username, password);

      return Right(const AuthenticatedUserEntity.empty());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
