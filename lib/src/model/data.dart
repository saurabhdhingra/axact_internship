import 'package:flutter_ecommerce_app/src/model/category.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference productsList =
      Firestore.instance.collection('products');

  Future getProductsList() async {
    List productList = [];
    try {
      await productsList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          productList.add(element.data);
        });
      });
      return productList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

