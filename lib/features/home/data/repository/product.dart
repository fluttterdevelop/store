

import 'package:store/core/extensions/model_extensions.dart';

import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product.dart';
import '../data_source/remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final HomeRemoteDataSource _remoteDataSource;

  const ProductRepositoryImpl(HomeRemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ServerFailure, List<ProductEntity>>> getProducts() async {
    try {
      final productModelList = await _remoteDataSource.getProducts();

      return Right(
        productModelList.map((model) => model.toEntity).toList(),
      );
    } on ServerException catch (exception) {
      return Left(ServerFailure());
    }
  }
}
