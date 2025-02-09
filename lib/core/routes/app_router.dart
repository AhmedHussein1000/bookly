import 'package:bookly/core/di/service_locator.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/widgets/no_route_defined_screen.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/presentation/controllers/home_books_bloc/home_books_bloc.dart';
import 'package:bookly/features/books/presentation/controllers/similar_books_bloc/similar_books_bloc.dart';
import 'package:bookly/features/books/presentation/screens/book_details_screen.dart';
import 'package:bookly/features/books/presentation/screens/home_screen.dart';
import 'package:bookly/features/books/presentation/controllers/search_book_bloc/search_book_bloc.dart';
import 'package:bookly/features/books/presentation/screens/search_screen.dart';
import 'package:bookly/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
 Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeBooksBloc(getIt(), getIt())
                    ..add(
                      const GetFeaturedBooksEvent(),
                    )
                    ..add(const GetNewestBooksEvent()),
                  child: const HomeScreen(),
                ));
      case Routes.bookDetailsScreen:
        return MaterialPageRoute(builder: (_) {
          final BookEntity book = arguments as BookEntity;
          return BlocProvider(
            create: (context) => SimilarBooksBloc(getIt())
              ..add(GetSimilarBooksEvent(category: book.category!)),
            child: BookDetailsScreen(
              book: book,
            ),
          );
        });
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchBookBloc(getIt()),
            child: const SearchScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NoRouteDefinedScreen());
    }
  }
}
