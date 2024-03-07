import 'package:bookly_app/Features/home/data/repos/home_repo_implment.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {

  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  ); getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

}
