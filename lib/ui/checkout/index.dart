import 'package:flutter/material.dart';
import 'package:inthe_store/models/order.dart';
import 'package:inthe_store/models/cart.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    Key? key
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
        title: const Text('Checkout')
      ),
      body: const CheckoutForm(),
    );
  }

}

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({
    Key? key
  }) : super(key: key);

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  
  final _formKey = GlobalKey<FormState>();
  final _order = Order();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name'
            ),
            onSaved: (String? value) {
              _order.name = value!;
            },
            validator: (String? value) => (value == null || value.isEmpty) 
              ? "Must not be empty" 
              : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Contact'
            ),
            onSaved: (String? value) {
              _order.contact = value!;
            },
            validator: (String? value) => (value == null || value.isEmpty) 
              ? "Must not be empty" 
              : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Address'
            ),
            onSaved: (String? value) {
              _order.address = value!;
            },
            validator: (String? value) => (value == null || value.isEmpty) 
              ? "Must not be empty" 
              : null,
          ),
          Consumer<Cart>(
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
              );
            }
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: TextButton(
                child: const Text('Place Order'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.tealAccent.shade700
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _order.cart = List.from(Provider.of<Cart>(context, listen: false).items);
                    // print('Name: ${_order.name}');
                    // print('Contact: ${_order.contact}');
                    // print('Address: ${_order.address}');
                    // print('Length: ${_order.cart.items.length}');
                    Navigator.pushReplacementNamed(
                      context, 
                      '/process_checkout',
                      arguments: _order
                    );
                  }
                }
              ),
            )
          )
        ],
      ),
    );
  }
}
