import 'package:bookly/core/helpers/assets.dart';
import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Assets.imagesBookly,
            height: 20,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () =>
                context.pushNamed(Routes.searchScreen)
              ,
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 17,
              ))
        ],
      ),
    );
  }
}
