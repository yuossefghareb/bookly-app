import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/home/presentation/views_models/bestseller_cubit/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Uti/widgets/custom_error_widget.dart';
import '../../../../../core/Uti/widgets/custom_loding_incndicor.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSucess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BestSellerListViewItem(
                    booksModel: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is BestSellerFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errorMessgae: state.erroMessage));
        } else {
          return const SliverToBoxAdapter(child: CustomLodingIndcator());
        }
      },
    );
  }
}
