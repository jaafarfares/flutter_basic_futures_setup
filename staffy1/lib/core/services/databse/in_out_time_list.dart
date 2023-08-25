import 'package:cloud_firestore/cloud_firestore.dart';

class TimeLogManager {
  late List<String> signinTime;
  late List<String> signoutTime;

  TimeLogManager(Map<String, dynamic> data) {
    // Initialize lists from the retrieved data
    signinTime = List<String>.from(data["signinTime"] ?? []);
    signoutTime = List<String>.from(data["signoutTime"] ?? []);
  }

  // Method to add new date-time values to the lists
  void addTimeLog(String newSignInTime, String newSignOutTime) {
    signinTime.add(newSignInTime);
    signoutTime.add(newSignOutTime);
  }

  // Method to save the updated data to Firestore
  Future<void> saveToFirestore(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("your_collection")
          .doc(documentId)
          .update({
        "signinTime": signinTime,
        "signoutTime": signoutTime,
      });
    } catch (e) {
      print("Error saving data to Firestore: $e");
    }
  }
}
