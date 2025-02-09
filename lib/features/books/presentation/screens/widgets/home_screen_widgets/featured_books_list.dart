import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/helpers/size_config.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/widgets/custom_book_image.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/home_books_bloc/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksList extends StatefulWidget {
  const FeaturedBooksList({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<FeaturedBooksList> createState() => _FeaturedBooksListState();
}

class _FeaturedBooksListState extends State<FeaturedBooksList> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadNextPage);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }


  Future<void> _loadNextPage() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (!isLoading&&
          context.read<HomeBooksBloc>().state is! FeaturedBooksNoMoreBooks) {
        setState(() {
          isLoading = true;
        });
        context
            .read<HomeBooksBloc>()
            .add(const GetFeaturedBooksEvent());
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
  setState(() {
    isLoading = false;
  });
}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.3,
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomBookImage(
          onTap: () => context.pushNamed(Routes.bookDetailsScreen,
              arguments: widget.books[index]),
          imageURL: widget.books[index].imageUrl,
          borderRadius: 16,
        ),
        itemCount: widget.books.length,
      ),
    );
  }
}
