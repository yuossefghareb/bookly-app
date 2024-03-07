import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly_app/Features/home/presentation/views_models/bestseller_cubit/best_seller_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views_models/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});

  final BooksModel book;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
   
  void initState() {
   BlocProvider.of<SimilarBookCubit>(context).fetchSimilarData(cat: widget.book.volumeInfo.categories!.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsViewbody(booksModel: widget.book,)),
    );
  }
}
