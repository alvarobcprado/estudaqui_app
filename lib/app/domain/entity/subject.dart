import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  const Subject({
    required this.bannerUrl,
    required this.description,
    required this.name,
  });

  final String bannerUrl;
  final String description;
  final String name;

  @override
  List<Object?> get props => [
        name,
        description,
        bannerUrl,
      ];
}
