import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerData() async {
    emit(BestSellerLoading());
    var data = await homeRepo.fetchBestSellerBooks();
    data.fold((faiure) {
      emit(BestSellerFailure(faiure.errorMessage));
    }, (books) {
      emit(BestSellerSucess(books));
    });
  }
}
