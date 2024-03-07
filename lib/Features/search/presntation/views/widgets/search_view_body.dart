
import 'package:bookly_app/Features/search/presntation/views/widgets/custom_search_textfiled.dart';
import 'package:flutter/material.dart';

class SearchViewbody extends StatelessWidget {
  const SearchViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomSearchTextFiled(),
        ],
      ),
    );
  }
}

class SearhResultListView extends StatelessWidget {
  const SearhResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
