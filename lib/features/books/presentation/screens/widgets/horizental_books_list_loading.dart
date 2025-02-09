import 'package:bookly/core/helpers/size_config.dart';
import 'package:bookly/core/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalBooksListLoading extends StatelessWidget {
  const HorizontalBooksListLoading(
      {super.key, this.listHeight, this.borderRadius});
  final double? listHeight;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: listHeight ?? SizeConfig.screenHeight * 0.3,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const CustomBookImage(imageURL: ''),
          itemCount: 5,
        ),
      ),
    );
  }
}
