part of 'find_one_book_bloc.dart';

@immutable
sealed class FindOneBookEvent {}

class FindOneBookProccessed extends FindOneBookEvent {
  final int id;

  FindOneBookProccessed(this.id);
}
