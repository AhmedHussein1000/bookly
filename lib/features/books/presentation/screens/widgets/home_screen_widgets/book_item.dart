import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/themes/app_styles.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/widgets/custom_book_image.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_rating.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.bookDetailsScreen, arguments: book),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: SizeConfig.screenHeight * 0.16,
        child: Row(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
              child: CustomBookImage(
                imageURL: book.imageUrl,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? 'unknown title',
                    style: Styles.fontMedium20(context)
                        .copyWith(fontFamily: AppConstants.kSectraFont),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Opacity(
                      opacity: 0.698,
                      child: Text(
                        book.firstAuthor ?? 'unknown author',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.fontMedium14(context),
                      )),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          AppConstants.free,
                          style: Styles.fontSemiBold20(context),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        BookRating(
                          ratingValue: book.averageRating?.toDouble() ?? 0.0,
                          ratingCount: book.ratingCount ?? 0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
