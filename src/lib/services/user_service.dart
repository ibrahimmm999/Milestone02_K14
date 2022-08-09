import 'package:milestone/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
      });
    } catch (e) {
      throw e;
    }
  }

  // Membuat data user menjadi dinamis
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
      );
    } catch (e) {
      throw e;
    }
  }
}
