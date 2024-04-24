// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoryModel {
  String? id;
  String? title;
  String? iconPath;
  List<String>? numberOfMerchants;
  List<String>? subcategories;
  bool? popularityIndicator;
  CategoryModel({
    this.id,
    this.title,
    this.iconPath,
    this.numberOfMerchants,
    this.subcategories,
    this.popularityIndicator,
  });

  CategoryModel copyWith({
    String? id,
    String? title,
    String? iconPath,
    List<String>? numberOfMerchants,
    List<String>? subcategories,
    bool? popularityIndicator,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
      numberOfMerchants: numberOfMerchants ?? this.numberOfMerchants,
      subcategories: subcategories ?? this.subcategories,
      popularityIndicator: popularityIndicator ?? this.popularityIndicator,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'iconPath': iconPath,
      'numberOfMerchants': numberOfMerchants,
      'subcategories': subcategories,
      'popularityIndicator': popularityIndicator,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      iconPath: map['iconPath'] != null ? map['iconPath'] as String : null,
      numberOfMerchants: map['numberOfMerchants'] != null ? List<String>.from((map['numberOfMerchants'] as List<String>)) : null,
      subcategories: map['subcategories'] != null ? List<String>.from((map['subcategories'] as List<String>)) : null,
      popularityIndicator: map['popularityIndicator'] != null ? map['popularityIndicator'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, iconPath: $iconPath, numberOfMerchants: $numberOfMerchants, subcategories: $subcategories, popularityIndicator: $popularityIndicator)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.iconPath == iconPath &&
      listEquals(other.numberOfMerchants, numberOfMerchants) &&
      listEquals(other.subcategories, subcategories) &&
      other.popularityIndicator == popularityIndicator;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      iconPath.hashCode ^
      numberOfMerchants.hashCode ^
      subcategories.hashCode ^
      popularityIndicator.hashCode;
  }
}
