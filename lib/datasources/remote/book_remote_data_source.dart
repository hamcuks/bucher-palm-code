import 'dart:developer';

import '../../models/api_response.dart';
import '../../models/book_model.dart';
import 'package:dio/dio.dart';

/// Contains set of function to book data
class BookRemoteDataSource {
  final Dio _dio;

  const BookRemoteDataSource(Dio dio) : _dio = dio;

  /// Return ApiResponse of BookModel
  ///
  /// Params: optional page, search param
  Future<ApiResponse<BookModel>> getAll(
      {required int page, String? search}) async {
    try {
      Map<String, dynamic> queryParams = {
        "page": page,
      };

      if (search != null) {
        queryParams.addAll({"search": search});
      }

      /// Perform GET HTTP request with given URL
      final response = await _dio.get(
        'https://gutendex.com/books/',
        queryParameters: queryParams,
      );

      /// Parse the response data using ApiResponse fromJson method
      return ApiResponse<BookModel>.fromJson(
        response.data,
        results: List<BookModel>.from(
          response.data['results'].map((x) => BookModel.fromJson(x)),
        ),
      );
    } catch (e) {
      log("Error: $e");

      /// Rethrow if error occurred during request or parsing the data
      rethrow;
    }
  }
}
