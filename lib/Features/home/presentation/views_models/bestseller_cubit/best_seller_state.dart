part of 'best_seller_cubit.dart';

sealed class BestSellerState extends Equatable {
  const BestSellerState();

  @override
  List<Object> get props => [];
}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerSucess extends BestSellerState {
  final List<BooksModel> books;
  const BestSellerSucess(this.books);
}

final class BestSellerFailure extends BestSellerState {
  final String erroMessage;
 const BestSellerFailure(this.erroMessage);
}

final class BestSellerLoading extends BestSellerState {}
