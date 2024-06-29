import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/book_repository.dart';
import 'package:meta/meta.dart';

part 'add_my_books_event.dart';
part 'add_my_books_state.dart';

class AddMyBooksBloc extends Bloc<AddMyBooksEvent, AddMyBooksState> {
  final BookRepository _repo;

  AddMyBooksBloc(BookRepository repository)
      : _repo = repository,
        super(const AddMyBooksState()) {
    on<AddMyBooksPressed>(_onAddMyBooksPressed);
    on<RemoveMyBooksPressed>(_onRemoveMyBooksPressed);
  }

  void _onAddMyBooksPressed(
      AddMyBooksPressed event, Emitter<AddMyBooksState> emit) async {
    try {
      emit(state.copyWith(status: AddMyBooksStatus.loading));
      await _repo.addToMyBooks(event.id);
      emit(state.copyWith(
        status: AddMyBooksStatus.success,
        message: "Book added to My Books successfully!",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AddMyBooksStatus.error,
        message: "Can not add book to My Books!",
      ));
    }
  }

  void _onRemoveMyBooksPressed(
      RemoveMyBooksPressed event, Emitter<AddMyBooksState> emit) async {
    try {
      emit(state.copyWith(status: AddMyBooksStatus.loading));
      await _repo.addToMyBooks(event.id);
      emit(state.copyWith(
        status: AddMyBooksStatus.success,
        message: "Book removed from My Books successfully!",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AddMyBooksStatus.error,
        message: "Can not remove book from My Books!",
      ));
    }
  }
}
