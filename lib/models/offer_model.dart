// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class OfferModel {
  final String? id;
  final String? offer;
  final String? availableUntil;
  final String? offerType;
  final List<String> availableDays;
  final int? minimumPurchase;
  final String? availableTime;
  final String? offerLocation;
  OfferModel({
    this.id,
    this.offer,
    this.availableUntil,
    this.offerType,
    required this.availableDays,
    this.minimumPurchase,
    this.availableTime,
    this.offerLocation,
  });

  OfferModel copyWith({
    String? id,
    String? offer,
    String? availableUntil,
    String? offerType,
    List<String>? availableDays,
    int? minimumPurchase,
    String? availableTime,
    String? offerLocation,
  }) {
    return OfferModel(
      id: id ?? this.id,
      offer: offer ?? this.offer,
      availableUntil: availableUntil ?? this.availableUntil,
      offerType: offerType ?? this.offerType,
      availableDays: availableDays ?? this.availableDays,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
      availableTime: availableTime ?? this.availableTime,
      offerLocation: offerLocation ?? this.offerLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'offer': offer,
      'availableUntil': availableUntil,
      'offerType': offerType,
      'availableDays': availableDays,
      'minimumPurchase': minimumPurchase,
      'availableTime': availableTime,
      'offerLocation': offerLocation,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      id: map['id'] != null ? map['id'] as String : null,
      offer: map['offer'] != null ? map['offer'] as String : null,
      availableUntil: map['availableUntil'] != null ? map['availableUntil'] as String : null,
      offerType: map['offerType'] != null ? map['offerType'] as String : null,
      availableDays: List<String>.from((map['availableDays'] as List<String>)),
      minimumPurchase: map['minimumPurchase'] != null ? map['minimumPurchase'] as int : null,
      availableTime: map['availableTime'] != null ? map['availableTime'] as String : null,
      offerLocation: map['offerLocation'] != null ? map['offerLocation'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) => OfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferModel(id: $id, offer: $offer, availableUntil: $availableUntil, offerType: $offerType, availableDays: $availableDays, minimumPurchase: $minimumPurchase, availableTime: $availableTime, offerLocation: $offerLocation)';
  }

  @override
  bool operator ==(covariant OfferModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.offer == offer &&
      other.availableUntil == availableUntil &&
      other.offerType == offerType &&
      listEquals(other.availableDays, availableDays) &&
      other.minimumPurchase == minimumPurchase &&
      other.availableTime == availableTime &&
      other.offerLocation == offerLocation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      offer.hashCode ^
      availableUntil.hashCode ^
      offerType.hashCode ^
      availableDays.hashCode ^
      minimumPurchase.hashCode ^
      availableTime.hashCode ^
      offerLocation.hashCode;
  }
}
