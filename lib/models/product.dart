import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String title;
  int price;
  String description;
  List images;
  String creationAt;
  String updatedAt;
  Map category;
  Product(
      {required this.category,
      required this.creationAt,
      required this.description,
      required this.id,
      required this.images,
      required this.price,
      required this.title,
      required this.updatedAt});
  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}
