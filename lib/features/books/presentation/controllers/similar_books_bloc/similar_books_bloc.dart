import 'dart:async';
import 'dart:developer';

import 'package:bookly/core/network/api_constants.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/books/domain/usecases/get_similar_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';

part 'similar_books_event.dart';
part 'similar_books_state.dart';

class SimilarBooksBloc extends Bloc<SimilarBooksEvent, SimilarBooksState> {
  final GetSimilarBooksUsecase _getSimilarBooksUsecase;

  SimilarBooksBloc(this._getSimilarBooksUsecase)
      : super(SimilarBooksInitial()) {
    on<GetSimilarBooksEvent>(_getSimilarBooks);
  }
  int _totalPages = 1;
  int _totalBooks = 0;
  int _currentPage = 0;
  Future<void> _getSimilarBooks(
      GetSimilarBooksEvent event, Emitter<SimilarBooksState> emit) async {
   
    log('totalPages $_totalPages totalSimilarBooks $_totalBooks currentPage $_currentPage');
    if (_currentPage >= _totalPages) {
      emit(const GetSimilarBooksNoMoreBooks(AppConstants.noMoreBooks));
    } else {
      emit(_currentPage == 0
          ? GetSimilarBooksLoading()
          : GetSimilarBooksPaginationLoading());

      var result = await _getSimilarBooksUsecase(GetSimilarBooksParams(
          category: event.category, pageNumber: _currentPage));
      result.fold((failure) {
        emit(_currentPage == 0
            ? GetSimilarBooksFailure(failure.errormsg)
            : GetSimilarBooksPaginationFailure(failure.errormsg));
      }, (booksResponse) {
        _totalBooks = booksResponse.totalItems;
        _totalPages = (_totalBooks / ApiConstants.pageSize).ceil();
        _currentPage =  _currentPage + 1;
        emit(GetSimilarBooksSuccess(booksResponse.books ?? []));
      });
    }
  }
}
