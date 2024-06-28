import 'package:bucher_palm_code/datasources/local/book_local_data_source.dart';
import 'package:bucher_palm_code/datasources/remote/book_remote_data_source.dart';
import 'package:bucher_palm_code/models/api_response.dart';
import 'package:bucher_palm_code/models/book_model.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class BookRepository {
  final BookRemoteDataSource _remote;
  final BookLocalDataSource _local;

  const BookRepository({
    required BookRemoteDataSource remoteDataSource,
    required BookLocalDataSource localDataSource,
  })  : _remote = remoteDataSource,
        _local = localDataSource;

  /// Check internet connection status
  Future<bool> get _hasInternet async {
    return InternetConnection().hasInternetAccess;
  }

  /// Return Single data of Book Model
  ///
  /// Params: required id
  Future<BookModel?> findOne(int id) async {
    try {
      /// Return data from local data source
      return await _local.findOne(id: id);
    } catch (e) {
      rethrow;
    }
  }

  /// Return List of Book Model
  ///
  /// Params: optional page, search param
  Future<List<BookModel>> getAll({
    required int page,
    required int pageSize,
    String? search,
    bool isFavorite = false,
  }) async {
    try {
      late ApiResponse<BookModel> data;

      /// If has internet and not favourite, then get the book data from remote data source
      if (await _hasInternet && !isFavorite) {
        data = await _remote.getAll(page: page, search: search);

        /// Store the book data into database
        _local.store(data.results);
      }

      List<BookModel> items = [];

      if (isFavorite) {
        items = await _local.getMyBooks(
          page: page,
          perPage: pageSize,
          search: search,
        );
      } else {
        items = await _local.getAll(
          page: page,
          perPage: pageSize,
          search: search,
        );
      }

      /// Return data from local data source
      return items;
    } catch (e) {
      rethrow;
    }
  }

  /// Add book data as favourite
  ///
  /// Params: required id
  Future addToMyBooks(int id) async {
    try {
      await _local.addToMyBooks(id);
    } catch (e) {
      rethrow;
    }
  }
}
