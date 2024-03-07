
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';

import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/core/Uti/styles.dart';

import 'package:flutter/material.dart';

import 'Featured_ListViewbuilder.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: customappbar()),
        SliverToBoxAdapter(child: FeaturedBookListView()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Best Seller',
              style: Styles.titleMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 20,
            ),
          ),
        ),
        BestSellerListView(),
      ],
    );
  }
}
