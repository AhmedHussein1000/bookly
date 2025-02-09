import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/home_books_bloc/home_books_bloc.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/book_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksList extends StatefulWidget {
  const NewestBooksList(
      {super.key, required this.books, required this.scrollController});
  final List<BookEntity> books;
  final ScrollController scrollController;
  @override
  State<NewestBooksList> createState() => _NewestBooksListState();
}

class _NewestBooksListState extends State<NewestBooksList> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_loadNextPage);
  }

  Future<void> _loadNextPage() async {
    if (widget.scrollController.position.pixels >=
        widget.scrollController.position.maxScrollExtent * 0.8) {
      if (!isLoading &&
          context.read<HomeBooksBloc>().state is! NewestBooksNoMoreBooks) {
        setState(() {
          isLoading = true;
        });
        context.read<HomeBooksBloc>().add(const GetNewestBooksEvent());
        await Future.delayed(
          const Duration(seconds: 2),
        );
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
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) => BookItem(
        book: widget.books[index],
      ),
      itemCount: widget.books.length,
    );
  }
}
