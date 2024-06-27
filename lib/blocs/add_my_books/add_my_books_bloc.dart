import 'package:bloc/bloc.dart';
import 'package:bucher_palm_code/repositories/book_repository.dart';
import 'package:meta/meta.dart';

part 'add_my_books_event.dart';
part 'add_my_books_state.dart';

class AddMyBooksBloc extends Bloc<AddMyBooksEvent, AddMyBooksState> {
  final BookRepository _repo;

  AddMyBooksBloc(BookRepository repository)
      : _repo = repository,
        super(const AddMyBooksState()) {
    on<AddMyBooksPressed>(_onAddMyBooksPressed);
  }

  void _onAddMyBooksPressed(
      AddMyBooksPressed event, Emitter<AddMyBooksState> emit) async {
    try {
      emit(state.copyWith(status: AddMyBooksStatus.loading));
      await _repo.addToMyBooks(event.id);
      emit(state.copyWith(status: AddMyBooksStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddMyBooksStatus.error));
    }
  }
}
