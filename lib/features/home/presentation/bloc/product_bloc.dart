import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecase/get_products.dart';
part 'product_state.dart';
part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductLoading()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final productsEither = await getProductsUseCase(NoParams());

        productsEither.fold(
              (failure) {
            emit(ProductError('Failed to fetch products'));
          },
              (products) {
            emit(ProductLoaded(products));
          },
        );
      } catch (e) {
        emit(ProductError('Failed to fetch products'));
      }
    });
  }

}
