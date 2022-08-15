import 'package:milestone/models/content_model.dart';
import 'package:milestone/services/content_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/moods_model.dart';
import '../services/mood_service.dart';
part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  MoodCubit() : super(MoodInitial());

  void fetchMood() async {
    try {
      emit(MoodLoading());
      List<MoodModel> mood = await MoodService().fetchMoods();
      emit(MoodSuccess(mood));
    } catch (e) {
      emit(MoodFailed(e.toString()));
    }
  }
}
