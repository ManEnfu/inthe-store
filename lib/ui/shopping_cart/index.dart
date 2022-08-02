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

    final List<String> pictures = [
      'assets/shoe1.png', 'assets/shoe2.jpg', 'assets/shoe3.jpg',
      'assets/shoe1.png', 'assets/shoe2.jpg', 'assets/shoe3.jpg',
      'assets/shoe1.png', 'assets/shoe2.jpg', 'assets/shoe3.jpg',
      'assets/shoe1.png', 'assets/shoe2.jpg',
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
              leading: Image.asset(
                pictures[index], 
                height: 56.0,
                width: 56.0,
                fit: BoxFit.cover,
              ),
              subtitle: Text(
                'Rp${prices[index]}', 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShoppingCartItemQty extends StatefulWidget {
  const ShoppingCartItemQty({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCartItemQty> createState() => _ShoppingCartItemQtyState();
}

class _ShoppingCartItemQtyState extends State<ShoppingCartItemQty> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 180),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
          // SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() { if (_qty > 1) _qty--; });
            },
          ),
          Text('$_qty'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() { _qty++; });
            },
          ),
        ],
      )
    );
  }
}
