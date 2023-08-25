import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  late String userid,
      name,
      phoneNumber,
      email,
      profession,
      photo,
      companyName,
      companyUID,
      password;
  bool accepted;
  List<String> signInList = [];
  List<String> signOutList = [];
  List<String> mapsPoints = [];
  TimeOfDay? workingStartTime;
  TimeOfDay? workingEndTime;
  UserModel({
    this.accepted = false,
    this.userid = '',
    this.name = '',
    this.phoneNumber = '',
    this.email = '',
    this.profession = '',
    this.photo = '',
    this.companyName = '',
    this.companyUID = '',
    this.password = '',
    this.signInList = const [],
    this.signOutList = const [],
    this.mapsPoints = const [],
    this.workingStartTime,
    this.workingEndTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userid: map['userid'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      profession: map['profession'],
      photo: map['photo'],
      companyName: map['companyName'],
      companyUID: map['companyUID'],
      password: map['password'],
      signInList: map['signInList'] != null
          ? List<String>.from(map['signInList'].map((x) => x))
          : [],
      signOutList: map['signOutList'] != null
          ? List<String>.from(map['signOutList'].map((x) => x))
          : [],
      mapsPoints: map['mapsPoints'] != null
          ? List<String>.from(map['mapsPoints'].map((x) => x))
          : [],
      accepted: map['accepted'] ?? false,
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

  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'profession': profession,
      'photo': photo,
      'companyName': companyName,
      'companyUID': companyUID,
      'signInList': signInList,
      'signOutList': signOutList,
      'mapsPoints': mapsPoints,
      'password': password,
      'accepted': accepted,
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
