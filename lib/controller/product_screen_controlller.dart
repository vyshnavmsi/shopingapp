import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapp/model/product_model.dart';

class DetailsController with ChangeNotifier {
  ProductModel? product;

  bool isLoading = false;
  Future<void> getData({required int count}) async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://fakestoreapi.com/products/$count');
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = detailsModelFromJson(response.body);
      }
    } catch (e) {
      log('$e');
    }
    isLoading = false;
    notifyListeners();
  }
}
