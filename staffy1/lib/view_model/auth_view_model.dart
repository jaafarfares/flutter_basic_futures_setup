import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:staffy/core/services/firestore_company.dart';
import 'package:staffy/core/services/firestore_user.dart';
import 'package:staffy/models/company_model.dart';
import 'package:staffy/models/user_model.dart';
import 'package:staffy/screens/auth_view/controll_view.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/profile_view_model.dart';

class AuthViewModel extends GetxController {
 // GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name, companyUID;
  Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    super.onClose();
  }

  late Rx<UserModel?> _userModel = Rx<UserModel?>(null);

  UserModel? get userModel => _userModel.value;

  Future<void> getUserData(String userId) async {
    //  loading.value = true;
    try {
      var userData = await FireStoreUser().getCurrentUser(userId);
      if (userData.data() != null && userData.data() is Map<String, dynamic>) {
        _userModel.value =
            UserModel.fromJson(userData.data() as Map<String, dynamic>);
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  final Rx<CompanyModel?> _companyModel = Rx<CompanyModel?>(null);

  CompanyModel? get companyModel => _companyModel.value;
  void CreateAccountWithEmailAndPassword() async {
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(
          color: primarycolor,
        ),
      ));

      print("Fetching data...");
      var data = await FireStoreCompany().getUserCompany(companyUID);
      print("Fetched data: $data");

      if (data.exists) {
        print("CompanyUID exists.");
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("User created: ${userCredential.user!.uid}");
        _companyModel.value =
            CompanyModel.fromJson(data.data() as Map<String, dynamic>);

        UserModel userModel = UserModel(
          userid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: name,
          photo: "default",
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profession: '',
          companyName: _companyModel.value!.companyName,
          companyUID: companyUID,
          signInList: _companyModel.value!.signInList,
          signOutList: _companyModel.value!.signOutList,
          mapsPoints: _companyModel.value!.mapsPoints,
          password: '',
          accepted: false,
          workingEndTime: _companyModel.value!.workingEndTime,
          workingStartTime: _companyModel.value!.workingStartTime,
        );

        await FireStoreUser().addusertoFireStore(userModel);

        print("Navigation to ControlView...");
        Get.offAll(() => ControlView());
      } else if (data.exists == false) {
        print("CompanyUID not found.");
        Get.snackbar(
          "CompanyUID not found. Please try again with a valid CompanyUID.",
          companyUID,
        );
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar('Auth Error', e.toString());
    } finally {
      print("Closing dialog...");
      Get.back();
    }
  }

  void signout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(ControlView());
  }

  void SignInWithEmailAndPassword() async {
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(
          color: primarycolor,
        ),
      ));

      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          if (value.data() != null && value.data() is Map<String, dynamic>) {}
        });
      });
      Get.offAll(() => (ControlView()));
    } catch (e) {
      print(e);
      Get.snackbar('auth error', e.toString(),
          snackPosition: SnackPosition.TOP, margin: EdgeInsets.all(20));
      Navigator.pop(Get.overlayContext!);
    }
  }

  /*   void saveuserCredential(UserCredential user, String name) async {
    String photoUrl = user.user!.photoURL ?? "default";

    UserModel userModel = UserModel(
      userid: user.user!.uid,
      email: user.user!.email!,
      name: name ?? user.user!.displayName ?? '',
      photo: photoUrl,
      phoneNumber: user.user!.phoneNumber ?? '',
      profession: '',
    );

    await FireStoreUser().addusertoFireStore(userModel);
    // await ProfileViewModel().getCompanyData();
  }
 */
  static Future<String?> changePassword(
      String oldPassword, String newPassword) async {
    User user = FirebaseAuth.instance.currentUser!;
    AuthCredential credential =
        EmailAuthProvider.credential(email: user.email!, password: oldPassword);

    Map<String, String?> codeResponses = {
      "user-mismatch": null,
      "user-not-found": null,
      "invalid-credential": null,
      "invalid-email": null,
      "wrong-password": null,
      "invalid-verification-code": null,
      "invalid-verification-id": null,
      "weak-password": null,
      "requires-recent-login": null
    };

    try {
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      await FireStoreUser().updateUserPasswordFirestore(user.uid, newPassword);
      return null;
    } on FirebaseAuthException catch (error) {
      return codeResponses[error.code] ?? "Unknown";
    }
  }

  Future<String?> changeEmail(String currentPassword, String newEmail) async {
    User user = FirebaseAuth.instance.currentUser!;
    AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);

    Map<String, String?> codeResponses = {
      "user-mismatch": null,
      "user-not-found": null,
      "invalid-credential": null,
      "invalid-email": null,
      "wrong-password": null,
      "invalid-verification-code": null,
      "invalid-verification-id": null,
      "weak-password": null,
      "requires-recent-login": null
    };

    try {
      await user.reauthenticateWithCredential(credential);
      await user.updateEmail(newEmail);
      await FireStoreUser().updateUserEmailFirestore(user.uid, newEmail);
      return null;
    } on FirebaseAuthException catch (error) {
      return codeResponses[error.code] ?? "Unknown!";
    }
  }
}














/*   void signinwithfacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    await _auth.signInWithCredential(facebookAuthCredential).then((user) {
      saveuserCredential(user, name);
    });
  }

  void signinwithgoogle() async {
    final GoogleSignInAccount? googleuser = await _googlesignin.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth.signInWithCredential(credential).then((user) {
      saveuserCredential(user, name);
      Get.offAll(ControlView());
    });
  } */
