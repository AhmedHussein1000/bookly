import 'package:bookly/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.close,
                size: 25,
              )),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                size: 17,
              ))
        ],
      ),
    );
  }
}
