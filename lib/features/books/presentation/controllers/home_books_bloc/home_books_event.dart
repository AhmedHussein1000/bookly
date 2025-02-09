part of 'home_books_bloc.dart';

sealed class HomeBooksEvent {
  const HomeBooksEvent();
}

class GetFeaturedBooksEvent extends HomeBooksEvent {
  
  const GetFeaturedBooksEvent();
}

class GetNewestBooksEvent extends HomeBooksEvent {
 
  const GetNewestBooksEvent();
}
