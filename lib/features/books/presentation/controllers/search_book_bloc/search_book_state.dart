part of 'search_book_bloc.dart';

class SearchBookState extends Equatable {
  final DefaultRequestState searchedBooksStates;
  final List<BookEntity> searchedBooks;
  final String searchedBooksErrorMessage;
  const SearchBookState(
      {this.searchedBooksStates = DefaultRequestState.initial,
      this.searchedBooks = const [],
      this.searchedBooksErrorMessage = ''});

  SearchBookState copyWith(
          {DefaultRequestState? searchedBooksStates,
          List<BookEntity>? searchedBooks,
          String? searchedBooksErrorMessage}) =>
      SearchBookState(
          searchedBooksStates: searchedBooksStates ?? this.searchedBooksStates,
          searchedBooks: searchedBooks ?? this.searchedBooks,
          searchedBooksErrorMessage:
              searchedBooksErrorMessage ?? this.searchedBooksErrorMessage);

  @override
  List<Object> get props =>
      [searchedBooksStates, searchedBooks, searchedBooksErrorMessage];
}
