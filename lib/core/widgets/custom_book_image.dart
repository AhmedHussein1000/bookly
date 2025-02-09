import 'package:bookly/core/helpers/assets.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key,
      required this.imageURL,
       this.aspectratio,
         this.borderRadius, this.onTap});
  final String? imageURL;
  final double? aspectratio;
  final double? borderRadius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius??10),
        child: AspectRatio(
          aspectRatio: aspectratio??2.8 / 4,
          child: CachedNetworkImage(
            
            fit: BoxFit.fill,
            imageUrl: imageURL??AppConstants.defaultImageUrl,
            placeholder: (context, url) => Image.asset(
              Assets.imagesLoading,
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
