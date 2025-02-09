import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/usecase/base_usecase.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';

class GetSimilarBooksUsecase
    extends BaseUsecase<BooksApiResponseEntity, GetSimilarBooksParams> {
  final BaseBooksRepository baseBooksRepository;
  GetSimilarBooksUsecase(this.baseBooksRepository);
  @override
  Future<Either<Failure, BooksApiResponseEntity>> call(
      GetSimilarBooksParams parameters) async{
    return await baseBooksRepository.getSimilarBooks(parameters);
  }
}

class GetSimilarBooksParams{
  final String category;
  final int pageNumber;
  const GetSimilarBooksParams({
    required this.category,
    this.pageNumber = 0,
  });
  }
