import 'package:bookly_app/Features/Splash/presntation/Views/splash_view.dart';
import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implment.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/homepage.dart';
import 'package:bookly_app/Features/home/presentation/views_models/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/Features/search/presntation/views/search_view.dart';
import 'package:bookly_app/core/Uti/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  // ignore: constant_identifier_names
  static const String KHomeView = '/homeview';
  // ignore: constant_identifier_names
  static const String KBookdetail = '/bookdetail';
  // ignore: constant_identifier_names
  static const String KSearchView = '/searhview';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: KSearchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: KHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: KBookdetail,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBookCubit(getIt.get<HomeRepoImpl>()),
        child: BookDetailsView(
          book: state.extra as BooksModel,
        ),
      ),
    ),
  ]);
}
