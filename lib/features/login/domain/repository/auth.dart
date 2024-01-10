import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../presentation/bloc/auth/authentication_bloc.dart';
import '../entities/authenticated_user.dart';

abstract class AuthenticationRepository {
  Future<Either<ServerFailure, AuthenticatedUserEntity>> getUser(String username, String password);
}