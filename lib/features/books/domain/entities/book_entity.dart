import 'package:equatable/equatable.dart';


class BookEntity extends Equatable {
  final String id;

  final String? title;

  final String? imageUrl;

  final String? firstAuthor;

  final String? description;

  final String? previewLink;

  final num? averageRating;

  final int? ratingCount;

  final String? category;

  const BookEntity(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.firstAuthor,
      required this.description,
      required this.previewLink,
      required this.averageRating,
      required this.ratingCount,
      required this.category});

  @override
  List<Object?> get props => [
        id
      ];
}
