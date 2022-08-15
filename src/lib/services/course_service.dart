import 'package:milestone/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milestone/models/journal_model.dart';

import '../models/course_model.dart';

class CourseService {
  CollectionReference _coursesReference =
      FirebaseFirestore.instance.collection('courses');
  Future<List<CourseModel>> fetchCourses() async {
    try {
      QuerySnapshot result = await _coursesReference.get();
      List<CourseModel> courses = result.docs.map((e) {
        return CourseModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return courses;
    } catch (e) {
      throw e;
    }
  }

  Future<CourseModel> getCourseById(String id) async {
    try {
      DocumentSnapshot snapshot = await _coursesReference.doc(id).get();
      return CourseModel(
        id: id,
        thumbnail: snapshot['thumbnail'],
        titleSub1: snapshot['titlesub1'],
        titleSub2: snapshot['titlesub2'],
        titleSub3: snapshot['titlesub3'],
        videoUrl1: snapshot['videoUrl1'],
        videoUrl2: snapshot['videoUrl2'],
        videoUrl3: snapshot['videoUrl3'],
      );
    } catch (e) {
      throw e;
    }
  }
}
