import 'package:json_annotation/json_annotation.dart';
part 'subject_rm.g.dart';

@JsonSerializable()
class SubjectRM {
  SubjectRM({
    required this.bannerUrl,
    required this.description,
    required this.name,
    required this.isActive,
  });

  final String bannerUrl;
  final String description;
  final String name;
  final bool isActive;

  Map<String, dynamic> toJson() => _$SubjectRMToJson(this);

  static const fromJson = _$SubjectRMFromJson;
}
