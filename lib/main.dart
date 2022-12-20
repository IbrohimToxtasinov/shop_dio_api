import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_dio_api/data/repository/app_repository.dart';
import 'package:shop_dio_api/screens/main_page.dart';
import 'package:shop_dio_api/screens/products_page.dart';
import 'package:shop_dio_api/view_model/categories_view_model.dart';
import 'package:shop_dio_api/view_model/product_view_model.dart';
import 'data/api_service/api_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProductsViewModel(
          appRepository: AppRepository(
            apiService: ApiService(),
          ),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoriesViewModel(
          appRepository: AppRepository(
            apiService: ApiService(),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
