import 'blocs/add_my_books/add_my_books_bloc.dart';
import 'blocs/find_one/find_one_book_bloc.dart';
import 'blocs/get_book/get_book_bloc.dart';
import 'datasources/local/book_local_data_source.dart';
import 'datasources/remote/book_remote_data_source.dart';
import 'repositories/book_repository.dart';
import 'services/database_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupDependency() {
  /// External Package
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DatabaseManager>(() => DatabaseManager.instance);

  /// Remote Data Sources
  sl.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSource(sl<Dio>()),
  );

  sl.registerLazySingleton<BookLocalDataSource>(
    () => BookLocalDataSource(sl<DatabaseManager>()),
  );

  /// Repositories
  sl.registerLazySingleton<BookRepository>(
    () => BookRepository(
      remoteDataSource: sl<BookRemoteDataSource>(),
      localDataSource: sl<BookLocalDataSource>(),
    ),
  );

  /// BLoCs
  sl.registerLazySingleton<GetBookBloc>(
    () => GetBookBloc(sl<BookRepository>()),
  );
  sl.registerLazySingleton<AddMyBooksBloc>(
    () => AddMyBooksBloc(sl<BookRepository>()),
  );
  sl.registerLazySingleton<FindOneBookBloc>(
    () => FindOneBookBloc(sl<BookRepository>()),
  );
}
