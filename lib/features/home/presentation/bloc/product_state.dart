part of 'product_bloc.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductLoaded(this.products);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductLoaded && runtimeType == other.runtimeType && products == other.products;

  @override
  int get hashCode => products.hashCode;
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductError && runtimeType == other.runtimeType && errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}
