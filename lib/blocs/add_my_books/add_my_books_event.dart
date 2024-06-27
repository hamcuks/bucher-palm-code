part of 'add_my_books_bloc.dart';

@immutable
sealed class AddMyBooksEvent {}

class AddMyBooksPressed extends AddMyBooksEvent {
  final int id;

  AddMyBooksPressed(this.id);
}
