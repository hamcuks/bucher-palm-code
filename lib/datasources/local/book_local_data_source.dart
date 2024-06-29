import '../../models/book_model.dart';
import '../../services/database_manager.dart';
import 'package:isar/isar.dart';

class BookLocalDataSource {
  final DatabaseManager _database;

  const BookLocalDataSource(DatabaseManager database) : _database = database;

  /// Return single data of Book Model
  Future<BookModel?> findOne({required int id}) async {
    try {
      final collection = _database.isar.Books;

      return collection.get(id);
    } catch (e) {
      rethrow;
    }
  }

  /// Return List of Book Model
  Future<List<BookModel>> getAll({
    required int page,
    required int perPage,
    String? search,
  }) async {
    try {
      final collection = _database.isar.Books;

      List<FilterOperation> filters = [];

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

  /// Return List of Book Model with isFavourite is true
  Future<List<BookModel>> getMyBooks({
    required int page,
    required int perPage,
    String? search,
  }) async {
    try {
      final collection = _database.isar.Books;

      List<FilterOperation> filters = [
        const FilterCondition.equalTo(
          property: "isFavourite",
          value: true,
        )
      ];

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
        /// Iterate the book items then check the existing data.
        ///
        /// We only put or store the data if not exist in database
        for (final item in items) {
          final data = await isar.Books.get(item.id);

          if (data != null) return;

          await isar.Books.put(item);
        }
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Return true if proccess success
  ///
  /// Params: required id
  Future<bool> addToMyBooks(int id) async {
    try {
      final isar = _database.isar;

      await isar.writeTxn(() async {
        BookModel? data = await isar.Books.get(id);

        if (data == null) return;

        data.isFavourite = !data.isFavourite;

        await isar.Books.put(data);
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
