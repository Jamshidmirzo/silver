import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson61/models/product.dart';

class Prdoucthttpservice {
  Future<List<Product>> getProducts() async {
    List<Product> loadedproducts = [];
    Uri url = Uri.parse('https://api.escuelajs.co/api/v1/products');
    final responce = await http.get(url);
    final jsonData = jsonDecode(responce.body);
    for (var element in jsonData) {
      loadedproducts.add(Product.fromJson(element));
    }
    return [...loadedproducts];
  }
}
