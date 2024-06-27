part of 'get_book_bloc.dart';

@immutable
sealed class GetBookEvent {}

class GetBookProccessed extends GetBookEvent {
  final int page;
  final String? search;

  GetBookProccessed({this.page = 1, this.search});
}
