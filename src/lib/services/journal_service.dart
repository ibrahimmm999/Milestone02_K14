import 'package:milestone/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milestone/models/journal_model.dart';

class JournalService {
  CollectionReference _journalsReference =
      FirebaseFirestore.instance.collection('journal');
  Future<List<JournalModel>> fetchJournals() async {
    try {
      QuerySnapshot result = await _journalsReference.get();
      List<JournalModel> journals = result.docs.map((e) {
        return JournalModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return journals;
    } catch (e) {
      throw e;
    }
  }

  Future<JournalModel> getJournalById(String id) async {
    try {
      DocumentSnapshot snapshot = await _journalsReference.doc(id).get();
      return JournalModel(
        id: id,
        title: snapshot['title'],
        content: snapshot['content'],
      );
    } catch (e) {
      throw e;
    }
  }
}
