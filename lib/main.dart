import 'package:flutter/material.dart';
import 'package:inthe_store/models/order.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:inthe_store/models/product.dart';
import 'package:inthe_store/models/cart.dart';

import 'package:inthe_store/ui/product_detail/index.dart';
import 'package:inthe_store/ui/shopping_cart/index.dart';
import 'package:inthe_store/ui/catalog/index.dart';
import 'package:inthe_store/ui/checkout/index.dart';
import 'package:inthe_store/ui/checkout/process_checkout.dart';

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
          product: ModalRoute.of(context)?.settings.arguments as Product,
        ),
        '/checkout': (context) => const CheckoutPage(),
        '/process_checkout': (context) => ProcessCheckoutPage(
          order: ModalRoute.of(context)?.settings.arguments as Order,
        ),
      },
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  // Jalankan StoreApp
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(), 
      child: const StoreApp()
    ),
  );
}





