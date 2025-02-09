import 'package:bookly/core/cache/hive_helper.dart';
import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/features/books/data/data_source/books_local_data_source.dart';
import 'package:bookly/features/books/data/data_source/books_remote_data_source.dart';
import 'package:bookly/features/books/data/repository/books_repository.dart';
import 'package:bookly/features/books/domain/repository/base_books_repository.dart';
import 'package:bookly/features/books/domain/usecases/get_featured_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_newest_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_similar_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/search_books_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // usecases
  getIt.registerLazySingleton(() => GetFeaturedBooksUsecase(getIt()));
  getIt.registerLazySingleton(() => GetNewestBooksUsecase(getIt()));
  getIt.registerLazySingleton(() => GetSimilarBooksUsecase(getIt()));
  getIt.registerLazySingleton(() => SearchBooksUsecase(getIt()));

  // repository
  getIt.registerLazySingleton<BaseBooksRepository>(
      () => BooksRepository(getIt(),
       getIt()
      ));
  // data sources
  getIt.registerLazySingleton<BaseBooksLocalDataSource>(
    () => BooksLocalDataSource(getIt()),
  );
  getIt.registerLazySingleton<BaseBooksRemoteDataSource>(
    () => BooksRemoteDataSourceImpl(getIt()),
  );
  // api services
  getIt.registerLazySingleton(() => ApiService());
  // helpers
  getIt.registerLazySingleton<HiveHelper>(() => HiveHelper());
}
