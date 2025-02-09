import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/usecase/base_usecase.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedBooksUsecase
    extends BaseUsecase<BooksApiResponseEntity, GetFeaturedBooksParams> {
  final BaseBooksRepository baseBooksRepository;

  GetFeaturedBooksUsecase(this.baseBooksRepository);
  @override
  Future<Either<Failure, BooksApiResponseEntity>> call(
      GetFeaturedBooksParams parameters) async {
    return await baseBooksRepository.getFeaturedBooks(parameters);
  }
}

class GetFeaturedBooksParams {
  final int pageNumber;

  GetFeaturedBooksParams({this.pageNumber = 0});
}
