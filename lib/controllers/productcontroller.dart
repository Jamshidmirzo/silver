import 'package:lesson61/models/product.dart';
import 'package:lesson61/services/prdoucthttpservice.dart';

class Productcontroller {
  final producthttpsevice = Prdoucthttpservice();
  Future<List<Product>> getProduct() {
    return producthttpsevice.getProducts();
  }
}
