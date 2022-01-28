import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  const Subject({
    required this.bannerUrl,
    required this.description,
    required this.name,
    required this.isActive,
  });

  final String bannerUrl;
  final String description;
  final String name;
  final bool isActive;

  @override
  List<Object?> get props => [
        name,
        description,
        bannerUrl,
      ];
}
