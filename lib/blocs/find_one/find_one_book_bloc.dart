import 'package:bucher_palm_code/repositories/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/book_model.dart';

part 'find_one_book_event.dart';
part 'find_one_book_state.dart';

class FindOneBookBloc extends Bloc<FindOneBookEvent, FindOneBookState> {
  final BookRepository _repo;

  FindOneBookBloc(BookRepository repository)
      : _repo = repository,
        super(const FindOneBookState()) {
    on<FindOneBookProccessed>(_onFindOneBookProccessed);
  }

  void _onFindOneBookProccessed(
      FindOneBookProccessed event, Emitter<FindOneBookState> emit) async {
    try {
      /// Change current status to loading
      emit(state.copyWith(status: FindOneBookStatus.loading));

      /// Get the data from repository
      final item = await _repo.findOne(event.id);
      print("Data: $item");

      /// Change current status to success and emit the data
      emit(state.copyWith(status: FindOneBookStatus.success, item: item));
    } catch (e) {
      /// Change current status to error and error message if error occurred
      emit(
        state.copyWith(
          status: FindOneBookStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
