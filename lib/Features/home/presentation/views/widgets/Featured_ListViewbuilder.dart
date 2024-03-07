import 'package:bookly_app/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/Features/home/presentation/views_models/featured_books_cubit/featuredbooks_cubit.dart';
import 'package:bookly_app/core/Uti/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/Uti/widgets/custom_loding_incndicor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Uti/routers.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbooksCubit, FeaturedbooksState>(
      builder: (context, state) {
        if (state is FeaturedbooksSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.KBookdetail, extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedbooksFailure) {
          return CustomErrorWidget(errorMessgae: state.errorMessage);
        } else {
          return const CustomLodingIndcator();
        }
      },
    );
  }
}
