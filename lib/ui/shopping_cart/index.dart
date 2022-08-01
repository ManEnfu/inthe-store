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

    final List<int> prices = [
      10000, 25000, 100000, 42000, 77000, 
      78000, 11000, 6000, 149000, 200000,
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
          return Card(
            child: ListTile(
              title: Text(items[index]),
              leading: const Icon(Icons.image, size: 56.0,),
              subtitle: Text(
                'Rp${prices[index]}', 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}

