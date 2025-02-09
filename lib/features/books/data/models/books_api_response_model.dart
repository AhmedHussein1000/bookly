import 'package:bookly/features/books/data/models/book_model.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';

class BooksApiResponseModel {
  final int? totalItems;
  final List<BookModel>? books;

  BooksApiResponseModel({
    required this.totalItems,
    required this.books,
  });

  factory BooksApiResponseModel.fromJson(Map<String, dynamic> json) {
    return BooksApiResponseModel(
        totalItems: json['totalItems'] as int? ??0,
        books: json['items'] != null
            ? List<BookModel>.from(
                json['items'].map((item) => BookModel.fromJson(item)))
            : []);
  }
  BooksApiResponseEntity toEntity() {
    return BooksApiResponseEntity(
        totalItems: totalItems??0,
        books: books
            ?.map(
              (e) => e.toEntity(),
            )
            .toList());
  }
}
