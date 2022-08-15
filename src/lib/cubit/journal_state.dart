part of 'journal_cubit.dart';

abstract class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object> get props => [];
}

class JournalInitial extends JournalState {}

class JournalLoading extends JournalState {}

class JournalSuccess extends JournalState {
  final List<JournalModel> journal;

  JournalSuccess(this.journal);
  @override
  // TODO: implement props
  List<Object> get props => [journal];
}

class JournalFailed extends JournalState {
  final String error;
  JournalFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
