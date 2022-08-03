import 'package:flutter/material.dart';
import 'package:inthe_store/models/product.dart';
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
      ),
      home: const CatalogPage(),
    );
  }
}

void main() {
  // Jalankan StoreApp
  runApp(const StoreApp());
}





