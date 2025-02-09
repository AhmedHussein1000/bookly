import 'package:bookly/core/helpers/size_config.dart';
import 'package:bookly/core/themes/app_styles.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/widgets/custom_book_image.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_rating.dart';
import 'package:bookly/features/books/presentation/screens/widgets/book_details_widgets/price_button.dart';
import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  const BookDetailsWidget({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
              height: SizeConfig.screenHeight * 0.35,
              child: CustomBookImage(
                imageURL: book.imageUrl,
                aspectratio: 2.7 / 4,
                borderRadius: 16,
              )),
        ),
        Text(
          book.title ?? AppConstants.unknownTitle,
          textAlign: TextAlign.center,
          style: Styles.fontSemiBold28(context),
        ),
        Opacity(
          opacity: 0.698,
          child: Text(
            book.firstAuthor ?? AppConstants.unknownAuthor,
            style: Styles.fontMedium18(context),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          ratingValue: book.averageRating?.toDouble() ?? 0.0,
          ratingCount: book.ratingCount ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: PriceButton(
            previewLink: book.previewLink ?? '',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
