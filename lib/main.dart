import 'package:bookly_app/Features/home/data/repos/home_repo_implment.dart';
import 'package:bookly_app/Features/home/presentation/views_models/bestseller_cubit/best_seller_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views_models/featured_books_cubit/featuredbooks_cubit.dart';
import 'package:bookly_app/contastns.dart';

import 'package:bookly_app/core/Uti/routers.dart';
import 'package:bookly_app/core/Uti/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BestSellerCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchBestSellerData(),
        ),
        BlocProvider(
          create: (context) => FeaturedbooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedData(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KPrimaryColor,
        ),
      ),
    );
  }
}
