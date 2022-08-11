import 'package:milestone/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentService {
  CollectionReference _contentsReference =
      FirebaseFirestore.instance.collection('content');
  Future<List<ContentModel>> fetchContents() async {
    try {
      QuerySnapshot result = await _contentsReference.get();
      List<ContentModel> contents = result.docs.map((e) {
        return ContentModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return contents;
    } catch (e) {
      throw e;
    }
  }

  Future<ContentModel> getContentById(String id) async {
    try {
      DocumentSnapshot snapshot = await _contentsReference.doc(id).get();
      return ContentModel(
        id: id,
        isMostViewed: snapshot['isMostViewed'],
        title: snapshot['title'],
        subtitle: snapshot['subtitle'],
        imageUrl: snapshot['imageUrl'],
      );
    } catch (e) {
      throw e;
    }
  }
}
