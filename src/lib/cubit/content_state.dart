part of 'content_cubit.dart';

abstract class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object> get props => [];
}

class ContentInitial extends ContentState {}

class ContentLoading extends ContentState {}

class ContentSuccess extends ContentState {
  final List<ContentModel> content;

  ContentSuccess(this.content);
  @override
  // TODO: implement props
  List<Object> get props => [content];
}

class ContentFailed extends ContentState {
  final String error;
  ContentFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
