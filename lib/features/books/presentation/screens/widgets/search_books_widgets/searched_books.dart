import 'dart:developer';

import 'package:bookly/core/utils/enums.dart';
import 'package:bookly/core/widgets/custom_text_message.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/book_item.dart';
import 'package:bookly/features/books/presentation/controllers/search_book_bloc/search_book_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/vertical_books_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedBooks extends StatefulWidget {
  const SearchedBooks({super.key, required this.categoryQuery});
  final String categoryQuery;
  @override
  State<SearchedBooks> createState() => _SearchedBooksState();
}

class _SearchedBooksState extends State<SearchedBooks> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<SearchBookBloc, SearchBookState>(
      builder: (context, state) {
        log('search books rebuild');
        switch (state.searchedBooksStates) {
          case DefaultRequestState.success:
            return SearchedBooksList(
              books: state.searchedBooks,
            );
          case DefaultRequestState.error:
            return CustomTextMessage(message: state.searchedBooksErrorMessage);
          case DefaultRequestState.loading:
            return const VerticalBooksListLoading(
              isSliver: false,
            );
          case DefaultRequestState.initial:
            return const SizedBox.shrink();
        }
      },
    ));
  }
}

class SearchedBooksList extends StatelessWidget {
  const SearchedBooksList({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) => BookItem(
        book: books[index],
      ),
      itemCount: books.length,
    );
  }
}
