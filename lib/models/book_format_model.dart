import 'package:isar/isar.dart';

part 'book_format_model.g.dart';

/// This model represents the Book format data that will
/// displayed to UI

@embedded
class BookFormatModel {
  /// I only put the required data
  final String? webPages;
  final String? epub;
  final String? image;
  final String? text;

  BookFormatModel({
    this.webPages,
    this.epub,
    this.image,
    this.text,
  });

  /// Factory method to decode the JSON data
  factory BookFormatModel.fromJson(Map<String, dynamic> json) {
    return BookFormatModel(
      webPages: json['text/html'],
      epub: json['application/epub+zip'],
      image: json['image/jpeg'],
      text: json['text/plain; charset=us-ascii'],
    );
  }
}
