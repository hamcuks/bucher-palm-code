import 'package:isar/isar.dart';

class DatabaseManager {
  static final DatabaseManager instance = DatabaseManager._();

  DatabaseManager._();

  /// Private Isar instance
  late Isar _isar;

  /// Getter for Isar instance
  Isar get isar => _isar;

  /// Open the Isar database
  Future<Isar> open({
    required List<CollectionSchema> schemas,
    required String directory,
  }) async {
    _isar = await Isar.open(schemas, directory: directory);
    return _isar;
  }
}
