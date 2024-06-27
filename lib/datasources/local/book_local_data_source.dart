import 'package:bucher_palm_code/models/book_model.dart';
import 'package:bucher_palm_code/services/database_manager.dart';
import 'package:isar/isar.dart';

class BookLocalDataSource {
  final DatabaseManager _database;

  const BookLocalDataSource(DatabaseManager database) : _database = database;

  /// Return List of Book Model
  Future<List<BookModel>> getAll({
    required int page,
    required int perPage,
    String? search,
  }) async {
    try {
      final collection = _database.isar.Books;

      List<FilterGroup> filters = [];

      if (search != null) {
        filters.add(
          FilterGroup.or([
            FilterCondition.contains(
              property: 'title',
              value: search,
              caseSensitive: false,
            ),
            FilterCondition.contains(
              property: 'languages',
              value: search,
              caseSensitive: false,
            ),
          ]),
        );
      }

      final Query<BookModel> queries = collection.buildQuery(
        filter: FilterGroup.and(filters),
        limit: perPage,
        offset: (page > 1) ? (page - 1) * perPage : 0,
      );

      return queries.findAll();
    } catch (e) {
      rethrow;
    }
  }

  /// Return true if proccess success
  ///
  /// Params: required items
  Future<bool> store(List<BookModel> items) async {
    try {
      final isar = _database.isar;

      await isar.writeTxn(() async {
        await isar.Books.putAll(items);
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
