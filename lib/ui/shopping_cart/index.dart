import 'package:flutter/material.dart';
import 'package:inthe_store/models/product.dart';

// Halaman Shopping Cart
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> items = [
      Product(id: '1', name: 'Item 1', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '2', name: 'Item 2', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '3', name: 'Item 3', price: 10000, image: 'assets/shoe3.jpg'),
      Product(id: '4', name: 'Item 4', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '5', name: 'Item 5', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '6', name: 'Item 6', price: 10000, image: 'assets/shoe3.jpg'),
      Product(id: '7', name: 'Item 7', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '8', name: 'Item 8', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '9', name: 'Item 9', price: 10000, image: 'assets/shoe3.jpg'),
      Product(id: '10', name: 'Item 10', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '11', name: 'Item 11', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '12', name: 'Item 12', price: 10000, image: 'assets/shoe3.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          tooltip: 'Back', 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Shopping Cart')
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    items[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  leading: Image.asset(
                    items[index].image, 
                    height: 56.0,
                    width: 56.0,
                    fit: BoxFit.cover,
                  ),
                  subtitle: Text(
                    'Rp${items[index].price}', 
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const ShoppingCartItemQty(),
              ]
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.tealAccent.shade400),
          )
        ),
        child: ListTile(
          title: const Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                )
              ),
          subtitle: const Text(
                'Rp100000',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
          trailing: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 150,
            ),
            child: TextButton(
              child: const Text('Checkout'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.tealAccent.shade700,
              ),
              onPressed: () {},
            ),
          )
        )
      )
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
    return Row(
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
    );
  }
}
