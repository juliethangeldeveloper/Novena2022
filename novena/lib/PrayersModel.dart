//"prayers": {
//    "id": 1,
//    "locale": "en",
//    "title": "English",
//    "rtl": 0,
//    "last_modified_date": 1537793842
//  },

import 'dart:convert';

import 'package:flutter/services.dart';

class PrayersModel {

  final String title;
  final String prayer;
  final String chorus;
  final String pray;
  PrayersModel(this.title, this.prayer, this.chorus, this.pray);

  factory PrayersModel.fromJson(Map<String, dynamic> json) =>
      _$PrayersModelFromJson(json);
@override
    String toString() {
        return "Title = $title, \nPrayer = $prayer, \nchorus = $chorus, \nPray = $pray";
    }
}


// **************************************************************************
// JsonSerializable
// **************************************************************************

 _$PrayersModelFromJson(Map<String, dynamic> json) => PrayersModel(
 
      json['title'] as String,
      json['prayer'] as String,
      json['chorus'] ?? "None",
      json['pray'] ?? "None",
    );

