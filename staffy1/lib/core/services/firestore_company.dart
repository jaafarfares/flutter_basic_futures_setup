import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staffy/models/company_model.dart';

class FireStoreCompany {
  final CollectionReference _companyCollection =
      FirebaseFirestore.instance.collection('companies');

  Future<DocumentSnapshot> getUserCompany(String uid) async {
    print("****************************************$uid");
    return await _companyCollection.doc(uid).get();
  }




}
