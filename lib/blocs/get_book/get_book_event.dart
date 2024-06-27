part of 'get_book_bloc.dart';

@immutable
sealed class GetBookEvent {}

class GetBookProccessed extends GetBookEvent {
  final int page;

  GetBookProccessed({this.page = 1});
}
