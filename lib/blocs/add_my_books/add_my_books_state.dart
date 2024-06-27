part of 'add_my_books_bloc.dart';

/// Set of BLoC status
enum AddMyBooksStatus { initial, loading, success, error }

/// Extension or shorthand to validate the BLoC status
extension AddMyBooksStatusX on AddMyBooksStatus {
  bool get isInitial => this == AddMyBooksStatus.initial;
  bool get isLoading => this == AddMyBooksStatus.loading;
  bool get isSuccess => this == AddMyBooksStatus.success;
  bool get isError => this == AddMyBooksStatus.error;
}

/// This class represent the BLoC state of GetBoot
class AddMyBooksState {
  final AddMyBooksStatus status;

  const AddMyBooksState({this.status = AddMyBooksStatus.initial});

  /// copyWith method to manipulate current data with the new one
  AddMyBooksState copyWith({AddMyBooksStatus? status}) {
    return AddMyBooksState(status: status ?? this.status);
  }
}
