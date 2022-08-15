import 'package:milestone/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milestone/models/moods_model.dart';

class MoodService {
  CollectionReference _moodsReference =
      FirebaseFirestore.instance.collection('moods');
  Future<List<MoodModel>> fetchMoods() async {
    try {
      QuerySnapshot result = await _moodsReference.get();
      List<MoodModel> moods = result.docs.map((e) {
        return MoodModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return moods;
    } catch (e) {
      throw e;
    }
  }

  Future<MoodModel> getContentById(String id) async {
    try {
      DocumentSnapshot snapshot = await _moodsReference.doc(id).get();
      return MoodModel(
        id: id,
        name: snapshot['name'],
        imageUrl1: snapshot['imageUrl1'],
        imageUrl2: snapshot['imageUrl2'],
      );
    } catch (e) {
      throw e;
    }
  }
}
