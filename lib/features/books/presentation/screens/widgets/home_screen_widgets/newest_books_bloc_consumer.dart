import 'dart:developer';

import 'package:bookly/core/functions/show_toast.dart';
import 'package:bookly/core/utils/enums.dart';
import 'package:bookly/core/widgets/custom_text_message.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/home_books_bloc/home_books_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/newest_books_list.dart';
import 'package:bookly/features/books/presentation/screens/widgets/vertical_books_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksBlocConsumer extends StatefulWidget {
  const NewestBooksBlocConsumer({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<NewestBooksBlocConsumer> createState() =>
      _NewestBooksBlocConsumerState();
}

class _NewestBooksBlocConsumerState extends State<NewestBooksBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBooksBloc, HomeBooksState>(
      buildWhen: (previous, current) =>
          current is NewestBooksLoading ||
          current is NewestBooksPaginationLoading ||
          current is NewestBooksSuccess ||
          current is NewestBooksError ||
          current is NewestBooksPaginationError ||
          current is NewestBooksNoMoreBooks,
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.newestBooks);
        }
        if (state is NewestBooksPaginationError) {
          customToast(message: state.message, state: ToastStates.error);
        }
        if (state is NewestBooksNoMoreBooks) {
          customToast(message: state.noMoreBooks, state: ToastStates.warning);
        }
      },
      builder: (context, state) {
        log('newest books rebuild , ${books.length}');

        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationError ||
            state is NewestBooksNoMoreBooks) {
          return NewestBooksList(
              books: books, scrollController: widget.scrollController);
        } else if (state is NewestBooksError) {
          return SliverFillRemaining(
              child: CustomTextMessage(message: state.message));
        }
        return const VerticalBooksListLoading(
          isSliver: true,
        );
      },
    );
  }
}
