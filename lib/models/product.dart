import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    this.description = "",
    required this.price,
    this.image = "",
  });

  String id;
  String name;
  String description;
  int price;
  String image;
}

void getProductsFromFirebase() async {
  FirebaseFirestore.instance
    .collection('products')
    .get()
    .then((QuerySnapshot q) {
      for (var doc in q.docs) {
        print("${doc.id} => ${doc.data()}");
      }   
    });
}
