part of 'similar_books_bloc.dart';

sealed class SimilarBooksState {
  const SimilarBooksState();
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class GetSimilarBooksLoading extends SimilarBooksState {}

final class GetSimilarBooksPaginationLoading extends SimilarBooksState {}

final class GetSimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;
 const GetSimilarBooksSuccess(this.books);
}

final class GetSimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;
 const GetSimilarBooksFailure(this.errorMessage);
}

final class GetSimilarBooksPaginationFailure extends SimilarBooksState {
  final String errorMessage;
 const GetSimilarBooksPaginationFailure(this.errorMessage);
}

final class GetSimilarBooksNoMoreBooks extends SimilarBooksState {
  final String message;

const GetSimilarBooksNoMoreBooks(this.message);
}
