part of 'get_book_bloc.dart';

@immutable
sealed class GetBookEvent {}

class GetBookProccessed extends GetBookEvent {
  final int page;
  final int pageSize;
  final String? search;
  final bool isFavorite;

  GetBookProccessed({
    this.page = 1,
    this.pageSize = 32,
    this.search,
    this.isFavorite = false,
  });
}
