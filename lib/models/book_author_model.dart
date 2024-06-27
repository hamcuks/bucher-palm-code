import 'package:isar/isar.dart';

part 'book_author_model.g.dart';

/// This model represents the Book author data that will
/// displayed to UI

@embedded
class BookAuthorModel {
  /// I only put the required data
  final String? name;
  final int? birthYear;
  final int? deathYear;

  BookAuthorModel({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  /// Factory method to decode the JSON data
  factory BookAuthorModel.fromJson(Map<String, dynamic> json) {
    return BookAuthorModel(
      name: json['name'],
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }
}
