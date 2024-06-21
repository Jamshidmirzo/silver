// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      category: json['category'] as Map<String, dynamic>,
      creationAt: json['creationAt'] as String,
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
      images: json['images'] as List<dynamic>,
      price: (json['price'] as num).toInt(),
      title: json['title'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
    };
