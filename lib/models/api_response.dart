/// This model represents the API Response data.
/// It contains the data count, next and prevs url, and the
/// results data
class ApiResponse<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  ApiResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    List<T> results = const [],
  }) {
    return ApiResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: results,
    );
  }
}
