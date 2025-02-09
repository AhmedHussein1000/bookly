import 'package:bookly/core/cache/hive_helper.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/entities/cached_books_response_entity.dart';
import 'package:bookly/features/books/domain/usecases/get_featured_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_newest_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_similar_books_usecase.dart';
import 'package:hive/hive.dart';

abstract class BaseBooksLocalDataSource {
  BooksApiResponseEntity? getCachedFeaturedBooks(
      {required GetFeaturedBooksParams parameters});
  BooksApiResponseEntity? getCachedNewestBooks(
      {required GetNewestBooksParams parameters});
  BooksApiResponseEntity? getCachedSimilarBooks(
      {required GetSimilarBooksParams parameters});
}

class BooksLocalDataSource extends BaseBooksLocalDataSource {
  final HiveHelper hiveHelper;

  BooksLocalDataSource(this.hiveHelper);
  @override
  BooksApiResponseEntity? getCachedFeaturedBooks(
      {required GetFeaturedBooksParams parameters}) {
    final box = Hive.box<CachedBooksResponseEntity>(HiveHelper.featuredBox);
    final cachedBooksResponseEntity = box.get(hiveHelper.getCacheKey(
        category: 'featured', pageNumber: parameters.pageNumber));
    if (cachedBooksResponseEntity != null) {
      return BooksApiResponseEntity(
          totalItems: cachedBooksResponseEntity.totalItems,
          books: cachedBooksResponseEntity.books
              .map((e) => e.toEntity())
              .toList());
    }
   return null;
  }

  @override
  BooksApiResponseEntity? getCachedNewestBooks(
      {required GetNewestBooksParams parameters}) {
    final box = Hive.box<CachedBooksResponseEntity>(HiveHelper.newestBox);
    final cachedBooksResponseEntity = box.get(hiveHelper.getCacheKey(
        category: 'newest', pageNumber: parameters.pageNumber));
    if (cachedBooksResponseEntity != null) {
      return BooksApiResponseEntity(
          totalItems: cachedBooksResponseEntity.totalItems,
          books: cachedBooksResponseEntity.books
              .map((e) => e.toEntity())
              .toList());
    }
    return null;
  }

  @override
  BooksApiResponseEntity? getCachedSimilarBooks(
      {required GetSimilarBooksParams parameters}) {
    final box = Hive.box<CachedBooksResponseEntity>(HiveHelper.similarBox);
    final cachedBooksResponseEntity = box.get(hiveHelper.getCacheKey(
        category: 'similar', pageNumber: parameters.pageNumber));
    if (cachedBooksResponseEntity != null 
       ) {
      return BooksApiResponseEntity(
          totalItems: cachedBooksResponseEntity.totalItems,
          books: cachedBooksResponseEntity.books.map((e) => e.toEntity()).toList());
    }
    return null;
  }
}
