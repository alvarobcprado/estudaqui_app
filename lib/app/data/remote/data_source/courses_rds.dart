import 'package:dio/dio.dart';

class CoursesRDS {
  const CoursesRDS({required Dio dio}) : _dio = dio;

  final Dio _dio;
}
