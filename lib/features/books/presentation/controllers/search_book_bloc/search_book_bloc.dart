import 'dart:async';
import 'package:bookly/core/helpers/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/enums.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/domain/usecases/search_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_book_event.dart';
part 'search_book_state.dart';

class SearchBookBloc extends Bloc<SearchBookEvent, SearchBookState> {
  final SearchBooksUsecase _searchBooksUsecase;
  SearchBookBloc(this._searchBooksUsecase) : super(const SearchBookState()) {
    on<GetSearchedBooksEvent>(
      _getSearchedBooks,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
  }

  Future<void> _getSearchedBooks(
      GetSearchedBooksEvent event, Emitter<SearchBookState> emit) async {
    if (event.categoryQuery.isNullOrEmpty()) {
      emit(state.copyWith(
          searchedBooksStates: DefaultRequestState.success, searchedBooks: []));
      return;
    }
    emit(state.copyWith(searchedBooksStates: DefaultRequestState.loading));

    var result = await _searchBooksUsecase(
        SearchBooksParams(categoryQuery: event.categoryQuery));

    result.fold((failure) {
      emit(state.copyWith(
          searchedBooksStates: DefaultRequestState.error,
          searchedBooksErrorMessage: failure.errormsg));
    }, (books) {
      emit(state.copyWith(
          searchedBooksStates: DefaultRequestState.success,
          searchedBooks: books));
    });
  }
}
