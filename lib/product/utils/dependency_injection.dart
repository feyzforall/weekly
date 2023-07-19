import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weekly/features/home/repository/article_repository.dart';
import 'package:weekly/features/home/view-model/articles_cubit.dart';
import 'package:weekly/product/utils/network_manager.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(
    ArticleRepository(
      NetworkManager(
        Dio(),
      ),
    ),
  );

  getIt.registerSingleton(
    ArticlesCubit(
      ArticleRepository(
        NetworkManager(
          Dio(),
        ),
      ),
    ),
  );
}
