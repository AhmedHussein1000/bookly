import 'package:bookly/core/themes/app_styles.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/newest_books_bloc_consumer.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/featured_books_bloc_consumer.dart';
import 'package:bookly/features/books/presentation/screens/widgets/home_screen_widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const HomeAppBar(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: FeaturedBooksBlocConsumer(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(AppConstants.newestBooks,
                    style: Styles.fontSemiBold20(context)),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        NewestBooksBlocConsumer(
          scrollController: _scrollController,
        ),
      ],
    );
  }
}
