import 'package:bucher_palm_code/blocs/get_book/get_book_bloc.dart';
import 'package:bucher_palm_code/datasources/remote/book_remote_data_source.dart';
import 'package:bucher_palm_code/repositories/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupDependency() {
  /// External Package
  sl.registerLazySingleton<Dio>(() => Dio());

  /// Remote Data Sources
  sl.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSource(sl<Dio>()),
  );

  /// Repositories
  sl.registerLazySingleton<BookRepository>(
    () => BookRepository(remoteDataSource: sl<BookRemoteDataSource>()),
  );

  /// BLoCs
  sl.registerLazySingleton<GetBookBloc>(
    () => GetBookBloc(sl<BookRepository>()),
  );
}
