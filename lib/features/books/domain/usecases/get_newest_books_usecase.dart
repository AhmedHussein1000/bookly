import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/usecase/base_usecase.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';

class GetNewestBooksUsecase extends BaseUsecase<BooksApiResponseEntity, GetNewestBooksParams> {
  final BaseBooksRepository baseBooksRepository;

  GetNewestBooksUsecase(this.baseBooksRepository);
  @override
  Future<Either<Failure, BooksApiResponseEntity>> call(GetNewestBooksParams parameters)async {
    return await baseBooksRepository.getNewestBooks( parameters);
  }
}

class GetNewestBooksParams {
  final int pageNumber;

  GetNewestBooksParams({this.pageNumber=0});
}
