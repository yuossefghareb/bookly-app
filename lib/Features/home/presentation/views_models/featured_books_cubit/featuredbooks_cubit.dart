import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'featuredbooks_state.dart';

class FeaturedbooksCubit extends Cubit<FeaturedbooksState> {
  FeaturedbooksCubit(this.homeRepo) : super(FeaturedbooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedData() async {
    emit(FeaturedbooksLoading());
    var data = await homeRepo.fetchFeaturedBooks();
    data.fold((faiure) {
      emit(FeaturedbooksFailure(faiure.errorMessage));
    }, (books) {
      emit(FeaturedbooksSucess(books));
    });
  }
}
