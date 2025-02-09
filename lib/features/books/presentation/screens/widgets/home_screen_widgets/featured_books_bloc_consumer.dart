import 'dart:developer';

import 'package:bookly/core/functions/show_toast.dart';
import 'package:bookly/core/helpers/size_config.dart';

import 'package:bookly/core/utils/enums.dart';
import 'package:bookly/core/widgets/custom_text_message.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/home_books_bloc/home_books_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/featured_books_list.dart';
import 'package:bookly/features/books/presentation/screens/widgets/horizental_books_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksBlocConsumer extends StatefulWidget {
  const FeaturedBooksBlocConsumer({super.key});

  @override
  State<FeaturedBooksBlocConsumer> createState() =>
      _FeaturedBooksBlocConsumerState();
}

class _FeaturedBooksBlocConsumerState extends State<FeaturedBooksBlocConsumer> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBooksBloc, HomeBooksState>(
      buildWhen: (previous, current) =>
          current is FeaturedBooksLoading ||
          current is FeaturedBooksPaginationLoading ||
          current is FeaturedBooksSuccess ||
          current is FeaturedBooksError ||
          current is FeaturedBooksPaginationError ||
          current is FeaturedBooksNoMoreBooks,
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.featuredBooks);
        }
        if (state is FeaturedBooksPaginationError) {
          customToast(
              message: state.message,
              state: ToastStates.error);
        }
        if (state is FeaturedBooksNoMoreBooks) {
          customToast(message: state.noMoreBooks, state: ToastStates.warning);
        }
      },
      builder: (context, state) {
        log('featured books rebuild, ${books.length}');
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationError ||
            state is FeaturedBooksNoMoreBooks) {
          return FeaturedBooksList(books: books);}
          else if(state is FeaturedBooksError){
               return SizedBox(
                height: SizeConfig.screenHeight * 0.3,
                child: CustomTextMessage(
                    message: state.message));
          }
        
            return const HorizontalBooksListLoading();
        });
      }
    
  }

