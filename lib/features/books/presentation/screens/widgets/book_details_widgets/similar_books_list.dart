import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/helpers/size_config.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/widgets/custom_book_image.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/similar_books_bloc/similar_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksList extends StatefulWidget {
  const SimilarBooksList(
      {super.key, required this.bookCategory, required this.books});
  final String bookCategory;
  final List<BookEntity> books;
  @override
  State<SimilarBooksList> createState() => _SimilarBooksListState();
}

class _SimilarBooksListState extends State<SimilarBooksList> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_loadNextPage);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _loadNextPage() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (!isLoading &&
          context.read<SimilarBooksBloc>().state
              is! GetSimilarBooksNoMoreBooks) {
        setState(() {
          isLoading = true;
        });
        context
            .read<SimilarBooksBloc>()
            .add(GetSimilarBooksEvent(category: widget.bookCategory));
      }
      await Future.delayed(
        const Duration(seconds: 2),
      );
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.15,
      child: ListView.separated(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) => CustomBookImage(
                onTap: () => context.pushNamed(Routes.bookDetailsScreen,
                    arguments: widget.books[index]),
                imageURL: getImage(url: widget.books[index].imageUrl),
              )),
    );
  }

  String? getImage({required String? url}) {
    if (url != null) {
      if (url.contains('https://') || url.contains('http://')) {
        return url;
      }
      return 'https://$url';
    }
    return null;
  }
}
