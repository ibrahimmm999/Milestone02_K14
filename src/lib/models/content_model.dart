import 'package:equatable/equatable.dart';

class ContentModel extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String subtitle;

  ContentModel({
    required this.id,
    this.title = '',
    this.imageUrl = '',
    this.subtitle = '',
  });

  factory ContentModel.fromJson(String id, Map<String, dynamic> json) =>
      ContentModel(
        id: id,
        title: json['title'],
        imageUrl: json['imageUrl'],
        subtitle: json['subtitle'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'subtitle': subtitle,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        subtitle,
      ];
}
