import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/Uti/api_service.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/books_model/books_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BooksModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              '/volumes?Filtering=free-ebooks&q=subject:programming&sortings=newest');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) return left(ServiceFailure.fromDioError(e));
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: '/volumes?Filtering=free-ebooks&q=programmingt');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) return left(ServiceFailure.fromDioError(e));
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              '/volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      print('hereeeee');
      if (e is DioError) return left(ServiceFailure.fromDioError(e));
      return left(ServiceFailure(e.toString()));
    }
  }
}
