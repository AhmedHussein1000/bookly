import 'dart:developer';

import 'package:bookly/core/functions/show_toast.dart';
import 'package:bookly/core/helpers/size_config.dart';

import 'package:bookly/core/utils/enums.dart';
import 'package:bookly/core/widgets/custom_text_message.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/similar_books_bloc/similar_books_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_details_widgets/similar_books_list.dart';
import 'package:bookly/features/books/presentation/screens/widgets/horizental_books_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksBlocConsumer extends StatefulWidget {
  const SimilarBooksBlocConsumer({super.key, required this.bookCategory});
  final String bookCategory;
  @override
  State<SimilarBooksBlocConsumer> createState() =>
      _SimilarBooksBlocConsumerState();
}

class _SimilarBooksBlocConsumerState extends State<SimilarBooksBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksBloc, SimilarBooksState>(
      listener: (context, state) {
        if (state is GetSimilarBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is GetSimilarBooksPaginationFailure) {
          customToast(message: state.errorMessage, state: ToastStates.error);
        }
        if (state is GetSimilarBooksNoMoreBooks) {
          customToast(message: state.message, state: ToastStates.warning);
        }
      },
      builder: (context, state) {
        log('similar books rebuild, ${books.length}');

        if (state is GetSimilarBooksSuccess ||
            state is GetSimilarBooksPaginationLoading ||
            state is GetSimilarBooksPaginationFailure ||
            state is GetSimilarBooksNoMoreBooks) {
          return SimilarBooksList(
              bookCategory: widget.bookCategory, books: books);
        } else if (state is GetSimilarBooksFailure) {
          return CustomTextMessage(message: state.errorMessage);
        } else {
          return HorizontalBooksListLoading(
            listHeight: SizeConfig.screenHeight * 0.15,
            borderRadius: 10,
          );
        }
      },
    );
  }
}
