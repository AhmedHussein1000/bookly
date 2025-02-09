import 'package:bookly/features/books/domain/entities/book_entity.dart';

class BooksApiResponseEntity {
  final int totalItems;
  final List<BookEntity>? books;

  BooksApiResponseEntity({required this.totalItems, required this.books});


}