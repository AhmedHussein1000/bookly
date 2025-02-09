
import 'package:bookly/core/helpers/dummy_data.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VerticalBooksListLoading extends StatelessWidget {
  const VerticalBooksListLoading({super.key, required this.isSliver});
  final bool isSliver;
  @override
  Widget build(BuildContext context) {
    return isSliver
        ? Skeletonizer.sliver(
            enabled: true,
            child: SliverList.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemBuilder: (context, index) =>
                  BookItem(book: DummyData.getBookDummyData()[index]),
              itemCount: DummyData.getBookDummyData().length,
            ),
          )
        : Expanded(
            child: Skeletonizer(
              enabled: true,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) => BookItem(book: DummyData.getBookDummyData()[index],
                ),
                itemCount: DummyData.getBookDummyData().length,
              ),
            ),
          );
  }
}
