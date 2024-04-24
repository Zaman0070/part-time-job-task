import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:jorden_job_task/models/offer_model.dart';

class MerchantModel {
  final int? id;
  final String? title;
  final String? brandImage;
  final String? phoneNumber;
  final String? emailAddress;
  final String? location;
  final String? logo;
  final String? category;
  final List<String>? tags;
  final List<OfferModel>? offers;
  final double? rating;
  MerchantModel({
    this.id,
    this.title,
    this.brandImage,
    this.phoneNumber,
    this.emailAddress,
    this.location,
    this.logo,
    this.category,
    this.tags,
    this.offers,
    this.rating,
  });

  MerchantModel copyWith({
    int? id,
    String? title,
    String? brandImage,
    String? phoneNumber,
    String? emailAddress,
    String? location,
    String? logo,
    String? category,
    List<String>? tags,
    List<OfferModel>? offers,
    double? rating,
  }) {
    return MerchantModel(
      id: id ?? this.id,
      title: title ?? this.title,
      brandImage: brandImage ?? this.brandImage,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      location: location ?? this.location,
      logo: logo ?? this.logo,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      offers: offers ?? this.offers,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'brandImage': brandImage,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'location': location,
      'logo': logo,
      'category': category,
      'tags': tags,
      'offers': offers?.map((x) => x.toMap()).toList(),
      'rating': rating,
    };
  }

  factory MerchantModel.fromMap(Map<String, dynamic> map) {
    return MerchantModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      brandImage: map['brandImage'] != null ? map['brandImage'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      emailAddress: map['emailAddress'] != null ? map['emailAddress'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      tags: map['tags'] != null ? List<String>.from(map['tags'] as List<dynamic>) : null,
      offers: map['offers'] != null ? List<OfferModel>.from((map['offers'] as List<dynamic>).map<OfferModel?>((x) => OfferModel.fromMap(x as Map<String, dynamic>)).toList()) : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MerchantModel.fromJson(String source) => MerchantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MerchantModel(id: $id, title: $title, brandImage: $brandImage, phoneNumber: $phoneNumber, emailAddress: $emailAddress, location: $location, logo: $logo, category: $category, tags: $tags, offers: $offers, rating: $rating)';
  }

  @override
  bool operator ==(covariant MerchantModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.brandImage == brandImage &&
      other.phoneNumber == phoneNumber &&
      other.emailAddress == emailAddress &&
      other.location == location &&
      other.logo == logo &&
      other.category == category &&
      listEquals(other.tags, tags) &&
      listEquals(other.offers, offers) &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      brandImage.hashCode ^
      phoneNumber.hashCode ^
      emailAddress.hashCode ^
      location.hashCode ^
      logo.hashCode ^
      category.hashCode ^
      tags.hashCode ^
      offers.hashCode ^
      rating.hashCode;
  }
}
