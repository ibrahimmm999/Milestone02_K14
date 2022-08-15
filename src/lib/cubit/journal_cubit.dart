import 'package:milestone/models/content_model.dart';
import 'package:milestone/services/content_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/journal_model.dart';
import '../services/journal_service.dart';
part 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(JournalInitial());

  void fetchJournal() async {
    try {
      emit(JournalLoading());
      List<JournalModel> journal = await JournalService().fetchJournals();
      emit(JournalSuccess(journal));
    } catch (e) {
      emit(JournalFailed(e.toString()));
    }
  }
}
