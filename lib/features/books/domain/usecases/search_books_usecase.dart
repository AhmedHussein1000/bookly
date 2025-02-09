import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/usecase/base_usecase.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUsecase
    extends BaseUsecase<List<BookEntity>, SearchBooksParams> {
  final BaseBooksRepository baseSearchRepository;

  SearchBooksUsecase(this.baseSearchRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call(SearchBooksParams parameters) {
    return baseSearchRepository.getSearchedBooks( parameters);
  }
}

class SearchBooksParams {
  final String categoryQuery;
  const SearchBooksParams({required this.categoryQuery});
}
