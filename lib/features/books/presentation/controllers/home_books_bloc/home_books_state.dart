part of 'home_books_bloc.dart';

sealed class HomeBooksState {
  const HomeBooksState();
}

final class HomeBooksInitial extends HomeBooksState {}

// featured
final class FeaturedBooksLoading extends HomeBooksState {}
final class FeaturedBooksPaginationLoading extends HomeBooksState {}

final class FeaturedBooksSuccess extends HomeBooksState {
  final List<BookEntity> featuredBooks;
  const FeaturedBooksSuccess({required this.featuredBooks});
}

final class FeaturedBooksError extends HomeBooksState {
  final String message;
  const FeaturedBooksError(this.message);
}
final class FeaturedBooksPaginationError extends HomeBooksState {
  final String message;
  const FeaturedBooksPaginationError(this.message);
}

final class FeaturedBooksNoMoreBooks extends HomeBooksState {
  final String noMoreBooks;
  const FeaturedBooksNoMoreBooks(this.noMoreBooks);
}

//newest
final class NewestBooksLoading extends HomeBooksState {}
final class NewestBooksPaginationLoading extends HomeBooksState {}

final class NewestBooksSuccess extends HomeBooksState {
  final List<BookEntity> newestBooks;

  const NewestBooksSuccess({required this.newestBooks});
}
final class NewestBooksError extends HomeBooksState {
  final String message;
  const NewestBooksError(this.message);
}

final class NewestBooksPaginationError extends HomeBooksState {
  final String message;
  const NewestBooksPaginationError(this.message);
}

final class NewestBooksNoMoreBooks extends HomeBooksState {
  final String noMoreBooks;
  const NewestBooksNoMoreBooks(this.noMoreBooks);
}
