/// This model represents the Book author data that will
/// displayed to UI
class BookAuthorModel {
  /// I only put the required data
  final String name;
  final int birthYear;
  final int deathYear;

  BookAuthorModel({
    required this.name,
    required this.birthYear,
    required this.deathYear,
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
