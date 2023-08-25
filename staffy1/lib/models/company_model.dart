import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompanyModel {
  late String companyName,
      companyUID,
      adminFullName,
      email,
      photo,
      phoneNumber,
      password;
  TimeOfDay? workingStartTime;
  TimeOfDay? workingEndTime;
  List<String> mapsPoints = [];
  List<String> signInList = [];
  List<String> signOutList = [];

  CompanyModel({
    this.companyName = "",
    this.companyUID = "",
    this.email = "",
    this.adminFullName = "",
    this.password = "",
    this.photo = "",
    this.phoneNumber = "",
    this.signInList = const [],
    this.signOutList = const [],
    this.mapsPoints = const [],
    this.workingStartTime,
    this.workingEndTime,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> map) {
    return CompanyModel(
      email: map["email"],
      adminFullName: map["adminFullName"],
      password: map["password"],
      photo: map["photo"],
      phoneNumber: map["phoneNumber"],
      companyName: map["companyName"],
      companyUID: map["companyUID"],
      signInList: map["signInList"] != null
          ? List<String>.from(map["signInList"].map((x) => x))
          : [],
      signOutList: map["signOutList"] != null
          ? List<String>.from(map["signOutList"].map((x) => x))
          : [],
      mapsPoints: map["mapsPoints"] != null
          ? List<String>.from(map["mapsPoints"].map((x) => x))
          : [],
      workingStartTime: map["workingStartTime"] != null
          ? TimeOfDay(
              hour: int.parse(map["workingStartTime"]["hour"]),
              minute: int.parse(map["workingStartTime"]["minute"]),
            )
          : null,
      workingEndTime: map["workingEndTime"] != null
          ? TimeOfDay(
              hour: int.parse(map["workingEndTime"]["hour"]),
              minute: int.parse(map["workingEndTime"]["minute"]),
            )
          : null,
    );
  }

  toJson() {
    return {
      'companyName': companyName,
      'companyUID': companyUID,
      'adminFullName': adminFullName,
      'email': email,
      'password': password,
      'photo': photo,
      'phoneNumber': phoneNumber,
      'signInList': signInList,
      'signOutList': signOutList,
      'mapsPoints': mapsPoints,
      if (workingStartTime != null)
        'workingStartTime': {
          'hour': workingStartTime!.hour,
          'minute': workingStartTime!.minute,
        },
      if (workingEndTime != null)
        'workingEndTime': {
          'hour': workingEndTime!.hour,
          'minute': workingEndTime!.minute,
        },
    };
  }
}
