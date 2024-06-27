import 'package:bucher_palm_code/models/book_model.dart';
import 'package:bucher_palm_code/services/database_manager.dart';
import 'package:isar/isar.dart';

class BookLocalDataSource {
  final DatabaseManager _database;

  const BookLocalDataSource(DatabaseManager database) : _database = database;

  Future<List<BookModel>> getAll() async {
    try {
      final collection = _database.isar.Books;

      return await collection.where().findAll();
    } catch (e) {
      rethrow;
    }
  }

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
