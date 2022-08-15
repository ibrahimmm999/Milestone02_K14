import 'package:equatable/equatable.dart';

class MoodModel extends Equatable {
  final String id;
  final String imageUrl1;
  final String imageUrl2;
  final String name;
  MoodModel({
    required this.id,
    this.imageUrl1 = '',
    this.imageUrl2 = '',
    this.name = '',
  });

  factory MoodModel.fromJson(String id, Map<String, dynamic> json) => MoodModel(
        id: id,
        name: json['name'],
        imageUrl1: json['imageUrl1'],
        imageUrl2: json['imageUrl2'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl1': imageUrl1,
        'imageUrl2': imageUrl2,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        imageUrl1,
        imageUrl2,
      ];
}
