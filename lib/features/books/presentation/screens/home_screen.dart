import 'package:bookly/features/books/presentation/controllers/home_books_bloc/home_books_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
          context.read<HomeBooksBloc>().add(const GetFeaturedBooksEvent());
          context.read<HomeBooksBloc>().add(const GetNewestBooksEvent());
        },
          child: const SafeArea(child: HomeBody())),
    );
  }
}
