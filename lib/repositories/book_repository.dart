import 'package:bucher_palm_code/datasources/remote/book_remote_data_source.dart';
import 'package:bucher_palm_code/models/book_model.dart';

class BookRepository {
  final BookRemoteDataSource _remote;

  const BookRepository({
    required BookRemoteDataSource remoteDataSource,
  }) : _remote = remoteDataSource;

  /// Return List of Book Model
  ///
  /// Params: optional page, search param
  Future<List<BookModel>> getAll({required int page, String? search}) async {
    try {
      /// Get the book data from remote data source
      final data = await _remote.getAll(page: page, search: search);

      return data.results;
    } catch (e) {
      rethrow;
    }
  }
}
