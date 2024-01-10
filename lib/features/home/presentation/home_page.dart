import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store/features/home/presentation/pages/single_product.dart';

import 'bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    // Do not access the context here
    // productBloc = BlocProvider.of<ProductBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // Access the ProductBloc using BlocProvider.of<ProductBloc>(context) here
    productBloc = BlocProvider.of<ProductBloc>(context);
    // Dispatch the FetchProducts event
    productBloc.add(FetchProducts());

    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeStore'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is ProductLoaded) {
            final list = state.products;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: list.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<ProductBloc>().add(FetchProducts());
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (_) => SingleProductPage(
                        product: list[index],
                      ),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: double.maxFinite,
                          height: 80,
                          child: Image.network(list[index].image),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          list[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          list[index].description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'price : \$${list[index].price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    productBloc.close();
    super.dispose();
  }
}
