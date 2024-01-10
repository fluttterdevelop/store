import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
@Freezed()
class ProductEntity with _$ProductEntity{
  const factory ProductEntity({
    required int id,
    required  String title,
    required double price,
    required  String description,
    required  String category,
    required  String image,

  }) = _ProductEntity;
}