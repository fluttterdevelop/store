import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

part 'product.freezed.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default(0) int id,
    @Default('') String title,
    @Default(0) double price,
    @Default('') String description,
    @Default('') String category,
    @Default('') String image,
    @JsonKey(name: 'rating') ProductRatingModel? productRatingModel,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);
}

@JsonSerializable()
class ProductRatingModel {
  @JsonKey(defaultValue: 0)
  final double rate;
  @JsonKey(defaultValue: 0)
  final int count;

  ProductRatingModel({required this.rate, required this.count});

  factory ProductRatingModel.fromJson(Map<String, dynamic> data) =>
      _$ProductRatingModelFromJson(data);

  Map<String, dynamic> toMap() => _$ProductRatingModelToJson(this);
}
