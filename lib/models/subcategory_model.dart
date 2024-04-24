// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SubCategoryModel {
  final String? id;
  final String? title;
  final String? iconPath;
  final List<String>? numberOfMerchants;
  SubCategoryModel({
    this.id,
    this.title,
    this.iconPath,
    this.numberOfMerchants,
  });

  SubCategoryModel copyWith({
    String? id,
    String? title,
    String? iconPath,
    List<String>? numberOfMerchants,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
      numberOfMerchants: numberOfMerchants ?? this.numberOfMerchants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'iconPath': iconPath,
      'numberOfMerchants': numberOfMerchants,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      iconPath: map['iconPath'] != null ? map['iconPath'] as String : null,
      numberOfMerchants: map['numberOfMerchants'] != null ? List<String>.from((map['numberOfMerchants'] as List<String>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) => SubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, title: $title, iconPath: $iconPath, numberOfMerchants: $numberOfMerchants)';
  }

  @override
  bool operator ==(covariant SubCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.iconPath == iconPath &&
      listEquals(other.numberOfMerchants, numberOfMerchants);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      iconPath.hashCode ^
      numberOfMerchants.hashCode;
  }
}
