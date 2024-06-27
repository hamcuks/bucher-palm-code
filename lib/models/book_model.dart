import 'book_author_model.dart';
import 'book_format_model.dart';

/// This model represents the Book data that will
/// displayed to UI
class BookModel {
  /// I only put the required data
  final int id;
  final String title;
  final List<BookAuthorModel> authors;
  final bool? copyright;
  final List<String> languages;
  final BookFormatModel formats;
  final int downloadCount;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    this.copyright = false,
    required this.languages,
    required this.formats,
    required this.downloadCount,
  });

  /// Factory method to decode the JSON data
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      authors: List<BookAuthorModel>.from(
          json['authors'].map((x) => BookAuthorModel.fromJson(x))),
      copyright: json['copyright'],
      languages: List<String>.from(json['languages']),
      formats: BookFormatModel.fromJson(json['formats']),
      downloadCount: json['download_count'],
    );
  }
}
