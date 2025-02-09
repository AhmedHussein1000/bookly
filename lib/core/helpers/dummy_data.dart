import 'package:bookly/features/books/domain/entities/book_entity.dart';

abstract class DummyData {
  static const BookEntity _bookEntity = BookEntity(
      id: '1',
      title: 'title',
      imageUrl: '',
      firstAuthor: 'firstAuthor',
      description: 'description',
      previewLink: 'previewLink',
      averageRating: 5.0,
      ratingCount: 100,
      category: 'category');

  static List<BookEntity> getBookDummyData() => List.generate(5, (index) => _bookEntity,);
}
