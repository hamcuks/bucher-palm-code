import 'dart:developer';

import 'package:bucher_palm_code/models/api_response.dart';
import 'package:bucher_palm_code/models/book_model.dart';
import 'package:dio/dio.dart';

/// Contains set of function to book data
class BookRemoteDataSource {
  final Dio _dio;

  const BookRemoteDataSource(Dio dio) : _dio = dio;

  /// Return ApiResponse of BookModel
  ///
  /// Params: optional page data
  Future<ApiResponse<BookModel>> getAll({int page = 1}) async {
    try {
      /// Perform GET HTTP request with given URL
      final response = await _dio.get('https://gutendex.com/books/?page=$page');

      /// Parse the response data using ApiResponse fromJson method
      return ApiResponse<BookModel>.fromJson(response.data);
    } catch (e) {
      log("Error: $e");

      /// Rethrow if error occurred during request or parsing the data
      rethrow;
    }
  }
}
