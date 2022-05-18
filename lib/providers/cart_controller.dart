import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/modelindex.dart';
import '../services/db_helper.dart';

class CartController with ChangeNotifier {
  List<Carts> _items = [];
  List<Carts> loadedItem = [];
  double _size = 0.0;
  int _numOfItem = 1;

  double get size => _size;
  int get numOfItem => _numOfItem;

  int get itemCount {
    return _items.length;
  }

  List<Carts> get items {
    return [..._items];
  }

  void changSize(String index) {
    _size = double.parse(index);
    notifyListeners();
  }

  void changeQuantity(int numItem) {
    _numOfItem = numItem;
    notifyListeners();
  }

  Future<void> addCartItem(
    double price,
    String model,
    String imgAddress,
    double size,
    int numOfItem,
    String unit,
  ) async {
    final cartItem = Carts(
      productId: DateTime.now().toString(),
      model: model,
      price: price,
      imgAddress: imgAddress,
      size: size,
      unit: unit,
      numOfItem: numOfItem,
    );

    _items.add(cartItem);
    DBHelper.insert('user_cart', {
      'id': cartItem.productId,
      'model': cartItem.model,
      'price': cartItem.price,
      'imgAddress': cartItem.imgAddress,
      'size': cartItem.size,
      'unit': cartItem.unit,
      'numOfItem': cartItem.numOfItem,
    });
    fetchAndSetCartItem();
    notifyListeners();
  }

  Future<void> fetchAndSetCartItem() async {
    final dataList = await DBHelper.getData("user_cart");

    loadedItem = dataList
        .map(
          (item) => Carts(
            productId: item['id'],
            model: item['model'],
            price: item['price'],
            imgAddress: item['imgAddress'],
            size: item['size'],
            unit: item['unit'],
            numOfItem: item['numOfItem'],
          ),
        )
        .toList();
    _items = loadedItem.toList();
    notifyListeners();
  }
}
