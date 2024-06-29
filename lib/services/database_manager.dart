import 'package:isar/isar.dart';

class DatabaseManager {
  static final DatabaseManager instance = DatabaseManager._();

  DatabaseManager._();

  /// Private Isar instance
  late Future<Isar> _isar;

  /// Getter for Isar instance
  Future<Isar> get isar => _isar;

  /// Open the Isar database
  Future<Isar> open({
    required List<CollectionSchema> schemas,
    required String directory,
  }) async {
    _isar = Isar.open(schemas, directory: directory);
    return _isar;
  }
}
