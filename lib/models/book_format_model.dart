/// This model represents the Book format data that will
/// displayed to UI
class BookFormatModel {
  /// I only put the required data
  final String? webPages;
  final String? epub;
  final String? image;
  final String? text;

  BookFormatModel({
    required this.webPages,
    required this.epub,
    required this.image,
    required this.text,
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
