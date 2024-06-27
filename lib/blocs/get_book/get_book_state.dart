part of 'get_book_bloc.dart';

/// Set of BLoC status
enum GetBookStatus { initial, loading, success, error }

/// Extension or shorthand to validate the BLoC status
extension GetBookStatusX on GetBookStatus {
  bool get isInitial => this == GetBookStatus.initial;
  bool get isLoading => this == GetBookStatus.loading;
  bool get isSuccess => this == GetBookStatus.success;
  bool get isError => this == GetBookStatus.error;
}

/// This class represent the BLoC state of GetBoot
class GetBookState {
  final GetBookStatus status;
  final List<BookModel> items;
  final String? errorMessage;

  const GetBookState({
    this.status = GetBookStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  /// copyWith method to manipulate current data with the new one
  GetBookState copyWith({
    GetBookStatus? status,
    List<BookModel>? items,
    String? errorMessage,
  }) {
    return GetBookState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
