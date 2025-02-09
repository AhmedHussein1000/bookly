import 'package:bookly/core/widgets/custom_text_form_field.dart';
import 'package:bookly/features/books/presentation/controllers/search_book_bloc/search_book_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/search_books_widgets/searched_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksBody extends StatefulWidget {
  const SearchBooksBody({super.key});

  @override
  State<SearchBooksBody> createState() => _SearchBooksBodyState();
}

class _SearchBooksBodyState extends State<SearchBooksBody> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextfield(
            hintText: 'Search here',
            onSubmitted: (value) => context.read<SearchBookBloc>().add(
                  GetSearchedBooksEvent(categoryQuery: value),
                ),
            controller: searchController,
            suffixIcon: IconButton(
                onPressed: () => context.read<SearchBookBloc>().add(
                      GetSearchedBooksEvent(
                          categoryQuery: searchController.text),
                    ),
                icon: const Icon(Icons.search)),
          ),
          const SizedBox(
            height: 30,
          ),
          SearchedBooks(
            categoryQuery: searchController.text,
          )
        ],
      ),
    );
  }
}
