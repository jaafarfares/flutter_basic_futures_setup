import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:staffy/models/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addusertoFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userid).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userCollection.doc(uid).get();
  }

  Future<void> updateUserDatafirestoreuser(UserModel userModel) async {
    try {
      final updateData = <String, dynamic>{};
      // update the user info only if the user has entered a new value
      if (userModel.name.isNotEmpty) {
        updateData['name'] = userModel.name;
      }

      if (userModel.phoneNumber.isNotEmpty) {
        updateData['phoneNumber'] = userModel.phoneNumber;
      }

      if (userModel.photo.isNotEmpty) {
        updateData['photo'] = userModel.photo;
      }

      if (userModel.profession.isNotEmpty) {
        updateData['profession'] = userModel.profession;
      }

      // here im updating the values i'm getting from the user company
      if (userModel.companyName.isNotEmpty) {
        updateData['companyName'] = userModel.companyName;
      }
      if (userModel.companyUID.isNotEmpty) {
        updateData['companyUID'] = userModel.companyUID;
      }

      await _userCollection.doc(userModel.userid).update(updateData);
    } catch (e) {
      print("Error while updating user data: $e");
    }
  }

  Future<void> updateUserPasswordFirestore(
      String userId, String newpassword) async {
    try {
      await _userCollection.doc(userId).update({'password': newpassword});
    } catch (e) {
      print("Error while updating user password: $e");
    }
  }

  Future<void> updateUserEmailFirestore(String userId, String newEmail) async {
    try {
      await _userCollection.doc(userId).update({'email': newEmail});
    } catch (e) {
      print("Error while updating user Email: $e");
    }
  }

  Future<void> updateUserPhotoFirestore(String userId, String img) async {
    try {
      await _userCollection.doc(userId).update({'photo': img});
    } catch (e) {
      print("Error while updating user photo: $e");
    }
  }
}
