
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/books_model/books_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarData({required String cat}) async {
    emit(SimilarBookLoading());
    var data = await homeRepo.fetchSimilarBooks(category: cat);
    data.fold((faiure) {
      emit(SimilarBookFailure(faiure.errorMessage));
    }, (books) {
      emit(SimilarBookSucess(books));
    });
  }
}
