import 'package:bookly/features/books/data/models/book_model.dart';
import 'package:bookly/features/books/domain/entities/cached_books_response_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String featuredBox = 'Featured Box';
  static const String newestBox = 'Newest Box';
  static const String similarBox = 'Similar Box';
  static const Duration _cacheDuration = Duration(days: 1);
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CachedBooksResponseEntityAdapter());
    Hive.registerAdapter(BookModelAdapter());
    await Hive.openBox<CachedBooksResponseEntity>(featuredBox);
    await Hive.openBox<CachedBooksResponseEntity>(newestBox);
    await Hive.openBox<CachedBooksResponseEntity>(similarBox);
  }

  Future<void> saveBooks(
      {required List<BookModel> books,
      required String boxKey,
      required String category,
      required int pageNumber,
      required int? totalItems,
      }) async {
    var box = Hive.box<CachedBooksResponseEntity>(boxKey);
    await box.put(
        getCacheKey(category: category, pageNumber: pageNumber),
        CachedBooksResponseEntity(
            books: books,
            timestamp: DateTime.now(),
            totalItems: totalItems ?? 0,
           ));
  }

  String getCacheKey({required String category, required int pageNumber}) =>
      '$category-page$pageNumber';
  CachedBooksResponseEntity? getBooks(
      {required String boxKey,
      required int pageNumber,
      required String category}) {
    var box = Hive.box<CachedBooksResponseEntity>(boxKey);
    return box.get(getCacheKey(category: category, pageNumber: pageNumber));
  }

  static Future<void> clearExpiredCache() async {
    final boxes = [featuredBox, newestBox, similarBox];
    final now = DateTime.now();

    for (final boxName in boxes) {
      final box = Hive.box<CachedBooksResponseEntity>(boxName);
      final keysToRemove = <dynamic>[];

      for (final key in box.keys) {
        final cached = box.get(key);
        if (cached != null &&
            now.difference(cached.timestamp) > _cacheDuration) {
          keysToRemove.add(key);
        }
      }

      await box.deleteAll(keysToRemove);
    }
  }
}
