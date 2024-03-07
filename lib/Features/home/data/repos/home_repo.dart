import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/books_model/books_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks({required String category});
}
