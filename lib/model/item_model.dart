import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemModel extends ChangeNotifier {

 List _items = [];

  get items => _items;

 String _currentCategory = "Vegetables";

 get currentCategory =>_currentCategory;

 void setCurrentCategory (String category){
  _currentCategory  = category;
  loadItems();
  notifyListeners();
  print('After Notify : $_currentCategory');
 }

 ItemModel() {
  //loadItems();
 }

 Future<void> loadItems() async {

  late String jsonString;
  if(currentCategory=="Vegetables")
  {
   jsonString = await rootBundle.loadString('lib/json/veg.json');
  }else if(currentCategory=="Fruits"){
   jsonString = await rootBundle.loadString('lib/json/fruit.json');
  }else if(currentCategory=="Meat"){
   jsonString = await rootBundle.loadString('lib/json/meat.json');
  }else if(currentCategory=="Seafood"){
   jsonString = await rootBundle.loadString('lib/json/sea.json');
  }else {
   print('not category passed');
  }

  //final jsonString = await rootBundle.loadString('lib/json/veg.json');
  final jsonItems = json.decode(jsonString);

  _items = List.from(jsonItems.map((item) => List<dynamic>.from(jsonItems)));



  notifyListeners();
 }

  
}



// class ItemModel extends ChangeNotifier {
//   List<Item> _items = [];

//   List<Item> get items => _items;

//   Future<void> loadItems() async {
//     final jsonString = await rootBundle.loadString('lib/json/items.json');
//     final jsonItems = json.decode(jsonString);

//     _items = List<Item>.from(jsonItems.map((item) => Item.fromJson(item)));

//     print(_items);

//     notifyListeners();
//   }
// }

// class Item {
//   final String image;
//   final String title;
//   final String price;

//   Item({
//     required this.image,
//     required this.title,
//     required this.price,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       image: json['image'],
//       title: json['title'],
//       price: json['price'],
//     );
//   }
// }


