import 'package:equatable/equatable.dart';

class JournalModel extends Equatable {
  final String id;
  final String title;
  final String content;
  JournalModel({
    required this.id,
    this.title = '',
    this.content = '',
  });

  factory JournalModel.fromJson(String id, Map<String, dynamic> json) =>
      JournalModel(
        id: id,
        title: json['title'],
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        content,
      ];
}
