import 'package:bookly/core/functions/custom_url_launch.dart';
import 'package:bookly/core/themes/app_styles.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({
    super.key,
    required this.previewLink,
  });
  final String previewLink;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextButton(
            backcolor: Colors.white,
            text: AppConstants.free,
            textStyle: Styles.fontBold18(context).copyWith(color: Colors.black),
            borderradius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ),
        ),
        Expanded(
          child: CustomTextButton(
            backcolor: const Color(0xffef8262),
            text: getpreviewtext(url: previewLink),
            textStyle: Styles.fontBold16(context).copyWith(
                color: Colors.white, fontFamily: AppConstants.kGilroyFont),
            borderradius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            onPressed: () async => await customUrlLaunch(url: previewLink),
          ),
        )
      ],
    );
  }

  String getpreviewtext({required String? url}) {
    if (url == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
