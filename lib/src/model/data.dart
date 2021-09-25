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

class AppData {
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/small_tilt_shoe_1.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Nike Air Max 92607',
        price: 220.00,
        isliked: false,
        image: 'assets/small_tilt_shoe_3.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/small_tilt_shoe_1.png',
        category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(),
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/shoe_thumb_2.png',
        isSelected: true),
    Category(id: 4, name: "Trousers", image: 'assets/tro.png'),
    Category(id: 2, name: "Jacket", image: 'assets/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/watch.png'),
  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
