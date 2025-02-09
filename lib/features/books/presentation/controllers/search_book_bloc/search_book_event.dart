part of 'search_book_bloc.dart';

sealed class SearchBookEvent  {
  const SearchBookEvent();
}

class GetSearchedBooksEvent extends SearchBookEvent {
  final String categoryQuery;

  const GetSearchedBooksEvent(
      {required this.categoryQuery});
}
