import 'dart:developer';
import 'package:bookly/core/errors/exceptions.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/books/data/data_source/books_local_data_source.dart';
import 'package:bookly/features/books/data/data_source/books_remote_data_source.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/repository/base_books_repository.dart';
import 'package:bookly/features/books/domain/usecases/get_featured_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_newest_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_similar_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/search_books_usecase.dart';
import 'package:dartz/dartz.dart';

class BooksRepository implements BaseBooksRepository {
  final BaseBooksLocalDataSource baseBooksLocalDataSource;
  final BaseBooksRemoteDataSource baseBooksRemoteDataSource;

  BooksRepository(
      this.baseBooksRemoteDataSource, this.baseBooksLocalDataSource);
  @override
  Future<Either<Failure, BooksApiResponseEntity>> getFeaturedBooks(
      GetFeaturedBooksParams parameters) async {
    try {
      final cachedResponse = baseBooksLocalDataSource.getCachedFeaturedBooks(
          parameters: parameters);
      if (cachedResponse != null && !cachedResponse.books.isNullOrEmpty()) {
        log('featured from cached');
        return Right(BooksApiResponseEntity(
            totalItems: cachedResponse.totalItems,
            books: cachedResponse.books));
      }
      final booksResponse =
          await baseBooksRemoteDataSource.getFeaturedBooks(parameters);

      log('featured from remote');
      return Right(booksResponse);
    } on DioNetworkException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('error in getFeaturedBooks repos ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unknownErrorMessage));
    }
  }

  @override
  Future<Either<Failure, BooksApiResponseEntity>> getNewestBooks(
      GetNewestBooksParams parameters) async {
    try {
      final cachedResponse =
          baseBooksLocalDataSource.getCachedNewestBooks(parameters: parameters);
      if (cachedResponse != null && !cachedResponse.books.isNullOrEmpty()) {
        log('newest from cached');
        return Right(BooksApiResponseEntity(
            totalItems: cachedResponse.totalItems,
            books: cachedResponse.books));
      }
      final booksResponse =
          await baseBooksRemoteDataSource.getNewestBooks(parameters);
      log('newest from remote');
      return Right(booksResponse);
    } on DioNetworkException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('error in getNewestBooks repos ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unknownErrorMessage));
    }
  }

  @override
  Future<Either<Failure, BooksApiResponseEntity>> getSimilarBooks(
      GetSimilarBooksParams parameters) async {
    try {
      final cachedResponse = baseBooksLocalDataSource.getCachedSimilarBooks(
          parameters: parameters);
      if (cachedResponse != null && !cachedResponse.books.isNullOrEmpty()) {
        log('similar from cached');
        return Right(BooksApiResponseEntity(
            totalItems: cachedResponse.totalItems,
            books: cachedResponse.books));
      }
      final booksResponse =
          await baseBooksRemoteDataSource.getSimilarBooks(parameters);
      log('similar from remote');
      return Right(booksResponse);
    } on DioNetworkException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('error in getSimilarBooks repos ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unknownErrorMessage));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getSearchedBooks(
      SearchBooksParams parameters) async {
    try {
      final List<BookEntity> searchedBooks =
          await baseBooksRemoteDataSource.getSearchedBooks(parameters);
      return Right(searchedBooks);
    } on DioNetworkException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('error in search repos ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unknownErrorMessage));
    }
  }
}
