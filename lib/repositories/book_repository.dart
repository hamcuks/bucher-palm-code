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

  /// Return List of Book Model
  ///
  /// Params: optional page, search param
  Future<List<BookModel>> getAll({required int page, String? search}) async {
    try {
      late ApiResponse<BookModel> data;

      /// If has internet, then get the book data from remote data source
      if (await _hasInternet) {
        data = await _remote.getAll(page: page, search: search);

        /// Store the book data into database
        _local.store(data.results);
      }

      /// Return data from local data source
      return await _local.getAll(
        page: page,
        perPage: 32,
        search: search,
      );
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
