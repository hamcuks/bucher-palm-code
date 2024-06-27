import 'package:bloc/bloc.dart';
import 'package:bucher_palm_code/models/book_model.dart';
import 'package:bucher_palm_code/repositories/book_repository.dart';
import 'package:meta/meta.dart';

part 'get_book_event.dart';
part 'get_book_state.dart';

class GetBookBloc extends Bloc<GetBookEvent, GetBookState> {
  final BookRepository _repo;

  GetBookBloc(BookRepository repository)
      : _repo = repository,
        super(const GetBookState()) {
    on<GetBookProccessed>(_onGetBookProccessed);
  }

  void _onGetBookProccessed(
      GetBookProccessed event, Emitter<GetBookState> emit) async {
    try {
      /// Change current status to loading
      emit(state.copyWith(status: GetBookStatus.loading));

      /// Get the data from repository
      final items = await _repo.getAll(page: event.page);

      /// Change current status to success and emit the data
      emit(state.copyWith(status: GetBookStatus.success, items: items));
    } catch (e) {
      /// Change current status to error and error message if error occurred
      emit(
        state.copyWith(status: GetBookStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
