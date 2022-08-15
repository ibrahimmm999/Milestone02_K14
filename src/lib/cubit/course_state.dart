part of 'course_cubit.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseSuccess extends CourseState {
  final List<CourseModel> course;

  CourseSuccess(this.course);
  @override
  // TODO: implement props
  List<Object> get props => [course];
}

class CourseFailed extends CourseState {
  final String error;
  CourseFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
