import 'package:milestone/models/content_model.dart';
import 'package:milestone/services/content_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  ContentCubit() : super(ContentInitial());

  void fetchContent() async {
    try {
      emit(ContentLoading());
      List<ContentModel> content = await ContentService().fetchContents();
      emit(ContentSuccess(content));
    } catch (e) {
      emit(ContentFailed(e.toString()));
    }
  }
}
