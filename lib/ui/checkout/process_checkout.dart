import 'package:flutter/material.dart';
import 'package:inthe_store/models/order.dart';
import 'package:inthe_store/models/cart.dart';
import 'package:provider/provider.dart';

class ProcessCheckoutPage extends StatelessWidget {
  const ProcessCheckoutPage({
    Key? key,
    required this.order
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: sendOrderToFirebase(order),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An Error Has Occured:\n${snapshot.error}', 
                textAlign: TextAlign.center,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Order Placed!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Finish'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.tealAccent.shade700,
                  ),
                  onPressed: () {
                    // Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pop(context);
                    Provider.of<Cart>(context).clearCart();
                  }
                )
              ]
            ),
          );
        }
      ),
    );
  }
}
