import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/mockdata.dart';

import '../models/modelindex.dart';

class ProductController with ChangeNotifier {
  final List<Products?> _item = [];

  List<Products?> get item {
    return [..._item];
  }

  Future<void> fetchAndSetProducts() async {
    final List<Products> loadedProducts = [];
    try {
      for (var item in shoeModels) {
        loadedProducts.add(
          Products(
            name: item.name,
            model: item.model,
            price: item.price,
            imgAddress: item.imgAddress,
            modelColor: item.modelColor,
            productInfo: item.productInfo,
          ),
        );
      }
    } on Exception {
      rethrow;
    }
    _item.clear();
    _item.addAll(loadedProducts);

    // _item = loadedProducts;
    notifyListeners();
  }
}
