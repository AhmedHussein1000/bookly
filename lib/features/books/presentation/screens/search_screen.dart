import 'package:bookly/features/books/presentation/screens/widgets/search_books_widgets/search_books_body.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchBooksBody()),
    );
  }
}
