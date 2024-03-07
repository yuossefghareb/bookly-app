import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/Books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_appbar_book_detail.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/simialr_books_list_view.dart';

import 'package:flutter/material.dart';

class BookDetailsViewbody extends StatelessWidget {
  const BookDetailsViewbody({super.key, required this.booksModel});

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBarBookDetail(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .17),
            child: CustomBookImage(
              imageUrl: booksModel.volumeInfo.imageLinks!.thumbnail,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Text(
            '${booksModel.volumeInfo.title}',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '${booksModel.volumeInfo.authors!.first}',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const RatingWidget(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 10,
          ),
           BooksAction(booksModel: booksModel),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also Like',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SimilarBooksListView(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
