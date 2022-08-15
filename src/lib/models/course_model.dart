import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String id;
  final String thumbnail;
  final String titleSub1;
  final String titleSub2;
  final String titleSub3;
  final String videoUrl1;
  final String videoUrl2;
  final String videoUrl3;
  CourseModel(
      {required this.id,
      this.thumbnail = '',
      this.titleSub1 = '',
      this.titleSub3 = '',
      this.videoUrl1 = '',
      this.videoUrl2 = '',
      this.videoUrl3 = '',
      this.titleSub2 = ''});

  factory CourseModel.fromJson(String id, Map<String, dynamic> json) =>
      CourseModel(
        id: id,
        thumbnail: json['thumbnail'],
        titleSub1: json['titleSub1'],
        titleSub2: json['titleSub2'],
        titleSub3: json['titleSub3'],
        videoUrl1: json['videoUrl1'],
        videoUrl2: json['videoUrl2'],
        videoUrl3: json['videoUrl3'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'thumbnail': thumbnail,
        'titleSub1': titleSub1,
        'titleSub2': titleSub2,
        'titleSub3': titleSub3,
        'videoUrl1': videoUrl1,
        'videoUrl2': videoUrl2,
        'videoUrl3': videoUrl3,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        thumbnail,
        titleSub1,
        titleSub2,
        titleSub3,
        videoUrl1,
        videoUrl2,
        videoUrl3
      ];
}
