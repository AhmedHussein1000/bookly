import 'dart:async';
import 'dart:developer';
import 'package:bookly/core/network/api_constants.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/books/domain/usecases/get_featured_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_newest_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
part 'home_books_event.dart';
part 'home_books_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {
  final GetFeaturedBooksUsecase _getFeaturedBooksUsecase;
  final GetNewestBooksUsecase _getNewestBooksUsecase;

  HomeBooksBloc(
    this._getFeaturedBooksUsecase,
    this._getNewestBooksUsecase,
  ) : super(HomeBooksInitial()) {
    on<GetFeaturedBooksEvent>(_getFeaturedBooks);
    on<GetNewestBooksEvent>(_getNewestBooks);
  }
  int _featuredBooksTotalPages = 1;
  int _featuredBooksTotalBooks = 0;
  int currentFeaturedPage = 0;
  Future<void> _getFeaturedBooks(
      GetFeaturedBooksEvent event, Emitter<HomeBooksState> emit) async {
    log('featuredBooksTotalPages $_featuredBooksTotalPages featuredBooksTotalBooks $_featuredBooksTotalBooks');
    if (currentFeaturedPage >= _featuredBooksTotalPages) {
      emit(const FeaturedBooksNoMoreBooks(AppConstants.noMoreBooks));
      return;
    }
    emit(currentFeaturedPage == 0
        ? FeaturedBooksLoading()
        : FeaturedBooksPaginationLoading());

    var result = await _getFeaturedBooksUsecase(
        GetFeaturedBooksParams(pageNumber: currentFeaturedPage));
    result.fold((failure) {
      emit(currentFeaturedPage == 0
          ? FeaturedBooksError(failure.errormsg)
          : FeaturedBooksPaginationError(failure.errormsg));
    }, (booksResponse) {
      _featuredBooksTotalBooks = booksResponse.totalItems;
      _featuredBooksTotalPages =
          (_featuredBooksTotalBooks / ApiConstants.pageSize).ceil();
       currentFeaturedPage = currentFeaturedPage + 1;   
      emit(FeaturedBooksSuccess(
          featuredBooks: booksResponse.books ??[],
          ));
    });
  }

  int _newestBookstotalPages = 1;
  int _newestBookstotalBooks = 0;
  int currentNewestPage = 0;
  Future<void> _getNewestBooks(
      GetNewestBooksEvent event, Emitter<HomeBooksState> emit) async {
    if (currentNewestPage >= _newestBookstotalPages) {
      emit(const NewestBooksNoMoreBooks(
           AppConstants.noMoreBooks));
    } else {
      emit(currentNewestPage == 0
          ? NewestBooksLoading()
          : NewestBooksPaginationLoading());

      var result = await _getNewestBooksUsecase(
          GetNewestBooksParams(pageNumber: currentNewestPage));
      result.fold((failure) {
        emit(currentNewestPage == 0
            ? NewestBooksError(
               failure.errormsg)
            : NewestBooksPaginationError( failure.errormsg));
      }, (booksResponse) {
        _newestBookstotalBooks = booksResponse.totalItems;
        _newestBookstotalPages =
            (_newestBookstotalBooks / ApiConstants.pageSize).ceil();
        currentNewestPage = currentNewestPage + 1;
        emit(NewestBooksSuccess(
            newestBooks: booksResponse.books ?? [],
            ));
      });
    }
  }
}
