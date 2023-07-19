import 'package:dartz/dartz.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/product/constants/endpoints.dart';
import 'package:weekly/product/utils/network_manager.dart';
import 'package:weekly/product/utils/server_exception.dart';

abstract class IArticleRepository {
  Future<Either<ServerException, Articles>> fetchPopularArticles();
}

class ArticleRepository extends IArticleRepository {
  final NetworkManager networkManager;

  ArticleRepository(this.networkManager);

  @override
  Future<Either<ServerException, Articles>> fetchPopularArticles() async {
    const String url = Endpoints.favoriteArticles;

    try {
      final response = await networkManager.get(url);
      return Right(
        Articles.fromJson(response),
      );
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}
