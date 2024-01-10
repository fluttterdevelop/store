import 'package:flutter/material.dart';
import 'package:store/features/home/domain/entities/product.dart';

class SingleProductPage extends StatelessWidget {
  final ProductEntity product;
  const SingleProductPage({
    super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 300,
              pinned: true,
              toolbarHeight: 70,

              flexibleSpace: FlexibleSpaceBar(
                title: Text(product.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),

                background: Image.network(product.image),

              ),

            ),

          ];
        },

        body:ListView(
          children: [
            Text(product.description,style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),

          ],
        )

      ),
    );
  }
}
