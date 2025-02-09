import 'package:bookly/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.ratingValue,
    required this.ratingCount,
  });
  final double ratingValue;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 13,
          color: Color(0xffffdd4f),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          ratingValue.toString(),
          style: Styles.fontRegular16(context),
        ),
        const SizedBox(
          width: 6,
        ),
        Opacity(
            opacity: 0.502,
            child:
                Text('($ratingCount)', style: Styles.fontRegular14(context))),
      ],
    );
  }
}
