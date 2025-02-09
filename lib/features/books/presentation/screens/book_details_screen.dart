import 'package:bookly/core/themes/app_styles.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_details_widgets/book_details_widget.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_details_widgets/book_details_appbar.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_details_widgets/similar_books_bloc_consumer.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const BookDetailsAppBar(),
              BookDetailsWidget(book: book),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppConstants.youMayAlsoLike,
                    style: Styles.fontMedium18(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SimilarBooksBlocConsumer(
                bookCategory: book.category!,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
