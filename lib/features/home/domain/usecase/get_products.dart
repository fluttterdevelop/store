import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/product.dart';
import '../repository/product.dart';

class GetProductsUseCase implements UseCase<List<ProductEntity>,NoParams>{
  final ProductRepository _productRepository;
  
  const GetProductsUseCase(ProductRepository repository)
      : _productRepository = repository;


  @override
  Future<Either<Failure, List<ProductEntity>>> call(params) {
    return _productRepository.getProducts();
  }
}