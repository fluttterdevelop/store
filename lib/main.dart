import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/injector/set_up_locator.dart';
import 'package:store/features/login/presentation/bloc/auth/authentication_bloc.dart';
import 'package:store/features/login/presentation/pages/splash_page.dart';

import 'features/home/data/data_source/remote_data_source.dart';
import 'features/home/data/repository/product.dart';
import 'features/home/domain/usecase/get_products.dart';
import 'features/home/presentation/bloc/product_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(const FakeStoreApp());
}

class FakeStoreApp extends StatelessWidget {
  const FakeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(GetProductsUseCase(
              ProductRepositoryImpl(HomeRemoteDataSource()))),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: SplashScreen()
        ),
    );
  }
}


//mor_2314
//83r5^_
