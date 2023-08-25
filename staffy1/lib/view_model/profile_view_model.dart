import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:staffy/core/services/firestore_company.dart';
import 'package:staffy/core/services/firestore_user.dart';
import 'package:staffy/models/company_model.dart';
import 'package:staffy/models/user_model.dart';
import 'package:get/get.dart';
import 'package:staffy/screens/auth_view/controll_view.dart';
import 'package:staffy/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getCompanyData(FirebaseAuth.instance.currentUser!.uid);

    getUserData(FirebaseAuth.instance.currentUser!.uid);
  }

//deal with the company data
/*   final Rx<CompanyModel?> _companyModel = Rx<CompanyModel?>(null);

  CompanyModel? get companyModel => _companyModel.value;
  Future<void> getCompanyData() async {
    try {
      var data = await FireStoreCompany().getUserCompany(userModel!.companyUID);
      print(userModel!.companyUID);
      print(data.toString());

      if (data.exists) {
        _companyModel.value =
            CompanyModel.fromJson(data.data() as Map<String, dynamic>);

        UserModel? currentUserData = _userModel.value;
        print(companyModel.toString());

        if (currentUserData != null && userModel != null) {
          currentUserData.companyName = _companyModel.value!.companyName;
          currentUserData.companyUID = userModel!.companyUID;
          print(companyModel.toString());
          print(companyModel!.mapsPoints.toString());

          await FireStoreUser().updateUserDatafirestoreuser(currentUserData);

          _userModel.value = currentUserData;
        }
      } else {
        print("**************** error not reading the data*******");
      }

      update();
    } catch (e) {
      print("Error in getCompanyData: $e");
    }
  }
 */
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);

  UserModel? get userModel => _userModel.value;

  Future<void> getUserData(String userId) async {
    loading.value = true;
    try {
      var userData = await FireStoreUser().getCurrentUser(userId);
      if (userData.data() != null && userData.data() is Map<String, dynamic>) {
        _userModel.value =
            UserModel.fromJson(userData.data() as Map<String, dynamic>);
      }
      loading.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  void signout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(ControlView());
  }

  void loadUserData(String userId) {
    getUserData(userId);
  }

  Future<void> updateUserData(UserModel userModel) async {
    try {
      loading.value = true;

      UserModel? currentUserData = _userModel.value;

      if (currentUserData != null && userModel != null) {
        if (userModel.name.isNotEmpty) currentUserData.name = userModel.name;
        if (userModel.phoneNumber.isNotEmpty)
          currentUserData.phoneNumber = userModel.phoneNumber;
        if (userModel.photo.isNotEmpty) currentUserData.photo = userModel.photo;
        if (userModel.profession.isNotEmpty)
          currentUserData.profession = userModel.profession;

        await FireStoreUser().updateUserDatafirestoreuser(currentUserData);

        _userModel.value = currentUserData;

        loading.value = false;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

// functions for updating the profile image

  Future<Uint8List?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    print(_file);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No image selected");
    return null;
  }

  late Uint8List _image;

  Future<void> selectImageAndUpdateFirestore(ImageSource source) async {
    try {
      Uint8List? img = await pickImage(source);

      /// print(img);
      if (img != null) {
        _image = img;

        if (_userModel.value != null) {
          await uploadImageToFirestore(_userModel.value!.userid, _image);
        }
      }
      update();
    } catch (e) {
      print("error while uploading image: $e");
    }
  }

  Future<void> uploadImageToFirestore(
      String userId, Uint8List imageBytes) async {
    try {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      await referenceImageToUpload.putData(imageBytes);

      String imageUrl = await referenceImageToUpload.getDownloadURL();
      UserModel updatedUserModel = UserModel(
        photo: imageUrl,
      );

      _userModel.value = updatedUserModel;

      await FireStoreUser().updateUserPhotoFirestore(userId, imageUrl);
      update();

      print("Image uploaded and URL updated");
    } catch (e) {
      print("Error in uploadImageToFirestore method: $e");
    }
  }
}
