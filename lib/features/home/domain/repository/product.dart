import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entities/product.dart';


abstract class  ProductRepository{
  Future<Either<ServerFailure, List<ProductEntity>>> getProducts();
}