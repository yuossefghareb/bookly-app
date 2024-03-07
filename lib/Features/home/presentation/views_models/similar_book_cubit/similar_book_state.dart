part of 'similar_book_cubit.dart';

sealed class SimilarBookState extends Equatable {
  const SimilarBookState();

  @override
  List<Object> get props => [];
}

final class SimilarBookInitial extends SimilarBookState {}
final class SimilarBookLoading extends SimilarBookState {}
final class SimilarBookSucess extends SimilarBookState {
  final List<BooksModel> books;
  const SimilarBookSucess(this.books);
}
final class SimilarBookFailure extends SimilarBookState {
  final String errorMessage;
 const SimilarBookFailure(this.errorMessage);
}

