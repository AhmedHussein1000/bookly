import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'book_model.g.dart';

@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final String? firstAuthor;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? previewLink;
  @HiveField(6)
  final num? averageRating;
  @HiveField(7)
  final int? ratingCount;
  @HiveField(8)
  final String? category;
  const BookModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.firstAuthor,
      required this.description,
      required this.previewLink,
      required this.averageRating,
      required this.ratingCount,
      required this.category});
  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>? ?? {};
    final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>? ?? {};
    final authors = volumeInfo['authors'] as List<dynamic>? ?? [];
    final categories = volumeInfo['categories'] as List<dynamic>? ?? [];

    return BookModel(
      id: json['id'],
      title: volumeInfo['title'] as String?,
      imageUrl: imageLinks['thumbnail'] as String?,
      firstAuthor: authors.isNotEmpty ? authors[0] as String? : null,
      description: volumeInfo['description'] as String?,
      previewLink: volumeInfo['previewLink'] as String?,
      averageRating: volumeInfo['averageRating'] as num?,
      ratingCount: volumeInfo['ratingsCount'] as int?,
      category: categories.isNotEmpty ? categories[0] as String? : null,
    );
  }
  BookEntity toEntity() {
    return BookEntity(
      id: id,
      title: title,
      imageUrl: imageUrl,
      firstAuthor: firstAuthor,
      description: description,
      previewLink: previewLink,
      averageRating: averageRating,
      ratingCount: ratingCount,
      category: category,
    );
  }
}
