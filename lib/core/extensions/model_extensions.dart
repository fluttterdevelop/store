import 'package:store/features/home/domain/entities/product.dart';

import '../../features/home/data/models/product.dart';

extension ProductModelExtension on ProductModel{
   ProductEntity get toEntity{
 return ProductEntity(
     id: id,
     title:title,
     image:image,
     category:category,
     price: price,
     description: description
 );


}
}