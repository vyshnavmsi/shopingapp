import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapp/model/product_model.dart';

class ProductController with ChangeNotifier {
  List<ProductModel> product = [];
  
  bool isLoading = false;
  Future<void> getData() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = productModelFromon(str: response.body);
      }
    } catch (e) {
      log('$e');
    }
    isLoading = false;
    notifyListeners();
  }
}
