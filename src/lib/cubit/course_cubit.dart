import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/course_model.dart';
import '../services/course_service.dart';
part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void fetchCourse() async {
    try {
      emit(CourseLoading());
      List<CourseModel> course = await CourseService().fetchCourses();
      emit(CourseSuccess(course));
    } catch (e) {
      emit(CourseFailed(e.toString()));
    }
  }
}
