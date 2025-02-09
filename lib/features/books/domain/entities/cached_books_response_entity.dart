import 'package:bookly/features/books/data/models/book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cached_books_response_entity.g.dart';

@HiveType(typeId: 0)
class CachedBooksResponseEntity {
  @HiveField(0)
  final List<BookModel> books;
  @HiveField(1)
  final DateTime timestamp;
  @HiveField(2)
  final int totalItems;
  

  CachedBooksResponseEntity({
    required this.books,
    required this.timestamp,
    required this.totalItems,
   
  });
}
