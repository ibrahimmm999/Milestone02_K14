part of 'mood_cubit.dart';

abstract class MoodState extends Equatable {
  const MoodState();

  @override
  List<Object> get props => [];
}

class MoodInitial extends MoodState {}

class MoodLoading extends MoodState {}

class MoodSuccess extends MoodState {
  final List<MoodModel> mood;

  MoodSuccess(this.mood);
  @override
  // TODO: implement props
  List<Object> get props => [mood];
}

class MoodFailed extends MoodState {
  final String error;
  MoodFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
