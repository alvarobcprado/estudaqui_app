import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_type.freezed.dart';

@freezed
class FailureType with _$FailureType {
  const FailureType._();

  const factory FailureType.normal() = NormalFailure;
  const factory FailureType.custom(
    String title,
    String message,
  ) = CustomFailure;
  const factory FailureType.noConnection() = NoConnectionFailure;
}
