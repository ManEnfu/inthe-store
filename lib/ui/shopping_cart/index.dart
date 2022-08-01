import 'package:flutter/material.dart';

// Halaman Shopping Cart
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5',
      'Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          tooltip: 'Back', 
          onPressed: () {},
        ),
        title: const Text('Shopping Cart')
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.teal.shade200,
            padding: const EdgeInsets.all(40.0),
            child: Text(items[index]),
          );
        },
      ),
    );
  }
}

