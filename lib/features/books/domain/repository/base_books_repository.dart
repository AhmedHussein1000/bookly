import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/usecases/get_featured_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_newest_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_similar_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/search_books_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBooksRepository {
  Future<Either<Failure, BooksApiResponseEntity>> getFeaturedBooks(
      GetFeaturedBooksParams parameters);
  Future<Either<Failure, BooksApiResponseEntity>> getNewestBooks(
      GetNewestBooksParams parameters );
  Future<Either<Failure,BooksApiResponseEntity>> getSimilarBooks(
      GetSimilarBooksParams parameters);
    Future<Either<Failure, List<BookEntity>>> getSearchedBooks(
      SearchBooksParams parameters);    
}
