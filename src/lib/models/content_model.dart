import 'package:equatable/equatable.dart';

class ContentModel extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String subtitle;
  final bool isMostViewed;

  ContentModel({
    required this.id,
    required this.isMostViewed,
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
          isMostViewed: json['isMostViewed']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'subtitle': subtitle,
        'isMostViewed': isMostViewed,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        subtitle,
        isMostViewed,
      ];
}
