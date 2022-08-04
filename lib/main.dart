import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:inthe_store/models/product.dart';
import 'package:inthe_store/models/cart.dart';

import 'package:inthe_store/ui/product_detail/index.dart';
import 'package:inthe_store/ui/shopping_cart/index.dart';
import 'package:inthe_store/ui/catalog/index.dart';

// Widget utama
class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'InThe Store', // Judul bebas
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Ubuntu',
      ),
      routes: {
        '/': (context) => const CatalogPage(),
        '/shopping_cart': (context) => const ShoppingCartPage(),
        '/product_detail': (context) => ProductDetailPage(
          product: ModalRoute.of(context)?.settings.arguments as Product
        ),
      },
    );
  }
}

void main() {
  // Jalankan StoreApp
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(), 
      child: const StoreApp()
    ),
  );
}





