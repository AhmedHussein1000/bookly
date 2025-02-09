part of 'similar_books_bloc.dart';

sealed class SimilarBooksEvent {
  const SimilarBooksEvent();

  
}

class GetSimilarBooksEvent extends SimilarBooksEvent {
  final String category;
  const GetSimilarBooksEvent( {required this.category});
}