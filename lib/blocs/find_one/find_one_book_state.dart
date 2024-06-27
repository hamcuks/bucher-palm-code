part of 'find_one_book_bloc.dart';

/// Set of BLoC status
enum FindOneBookStatus { initial, loading, success, error }

/// Extension or shorthand to validate the BLoC status
extension FindOneBookStatusX on FindOneBookStatus {
  bool get isInitial => this == FindOneBookStatus.initial;
  bool get isLoading => this == FindOneBookStatus.loading;
  bool get isSuccess => this == FindOneBookStatus.success;
  bool get isError => this == FindOneBookStatus.error;
}

/// This class represent the BLoC state of GetBoot
class FindOneBookState {
  final FindOneBookStatus status;
  final BookModel? item;
  final String? errorMessage;

  const FindOneBookState({
    this.status = FindOneBookStatus.initial,
    this.item,
    this.errorMessage,
  });

  /// copyWith method to manipulate current data with the new one
  FindOneBookState copyWith({
    FindOneBookStatus? status,
    BookModel? item,
    String? errorMessage,
  }) {
    return FindOneBookState(
      status: status ?? this.status,
      item: item ?? this.item,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
