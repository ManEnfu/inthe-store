import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:inthe_store/models/product.dart';
import 'package:inthe_store/models/cart.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: "1",
        name: "Shoe 1",
        description: "This is a shoe",
        price: 129000,
        image: "assets/shoe1.png"
      ),
      Product(
        id: "2",
        name: "Shoe 2",
        description: "This is another shoe",
        price: 129000,
        image: "assets/shoe2.jpg"
      ),
      Product(
        id: "3",
        name: "Shoe 3",
        description: "This is also a shoe",
        price: 129000,
        image: "assets/shoe3.jpg"
      ),
    ];
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu), 
          tooltip: 'Menu', 
          onPressed: () {},
        ),
        title: const Text('Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart), 
            tooltip: 'Shopping Cart', 
            onPressed: () {
              Navigator.pushNamed(context, '/shopping_cart');
            },
          ),
        ]
      ),
      body: FutureBuilder(
        future: getProductsFromFirebase(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An Error Has Occured:\n${snapshot.error}', 
                textAlign: TextAlign.center,
              ),
            );
          }
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return CatalogProductCard(product: products[index]);
              }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
      // body: ListView.builder(
      //   itemCount: products.length,
      //   padding: const EdgeInsets.all(10),
      //   itemBuilder: (BuildContext context, int index) {
      //       return CatalogProductCard(product: products[index]);
      //   },
      // ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product_detail', arguments: product);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Rp${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_outline),
                        onPressed: () {},
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 200),
                        child: TextButton.icon(
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text('Add to Cart'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.tealAccent.shade700,
                          ),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                              .addToCart(product);
                            Navigator.pushNamed(context, '/shopping_cart');
                          },
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
