import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:inthe_store/models/product.dart';
import 'package:inthe_store/models/cart.dart';

// Halaman Shopping Cart
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cart.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        cart.items[index].product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      leading: Image.network(
                        cart.items[index].product.image, 
                        height: 56.0,
                        width: 56.0,
                        fit: BoxFit.cover,
                      ),
                      subtitle: Text(
                        'Rp${cart.items[index].product.price}', 
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ShoppingCartItemQty(index: index),
                  ]
                ),
              );
            },
          );
        }
      ),
      bottomNavigationBar: const ShoppingCartTotal(),
    );
  }
}

class ShoppingCartItemQty extends StatelessWidget {
  const ShoppingCartItemQty({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).removeFromCart(index);
          },
        ),
        // SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).decItemQty(index);
          },
        ),
        Selector<Cart, int>(
          selector: (BuildContext context, Cart cart) {
            return cart.items[index].qty;
          },
          builder: (BuildContext context, int qty, Widget? child) {
            return Text('$qty');
          }
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).incItemQty(index);
          },
        ),
      ],
    );
  }
}

class ShoppingCartTotal extends StatelessWidget {
  const ShoppingCartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.tealAccent.shade400),
        )
      ),
      child: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListTile(
            title: const Text(
              'Total Price',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              )
            ),
            subtitle: Text(
              'Rp${cart.totalPrice}',
              style: const TextStyle(
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
                  backgroundColor: cart.items.isNotEmpty
                    ? Colors.tealAccent.shade700
                    : Colors.grey.shade400,
                ),
                onPressed: cart.items.isNotEmpty
                  ? () {
                    Navigator.pushNamed(context, '/checkout');
                  }
                  : null,
              ),
            )
          );
        }
      ),
    );
  }
}
