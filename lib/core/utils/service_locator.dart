import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_app/core/repos/home_repo_impl.dart';
import 'package:recipes_app/core/utils/services.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>((HomeRepoImpl(apiServices: getIt<ApiServices>())));
}