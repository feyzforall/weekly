import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/features/home/repository/article_repository.dart';
import 'package:weekly/product/utils/server_exception.dart';

import 'article_repository_test.mocks.dart';

final _mockArticles = {
  "status": "string",
  "copyright": "string",
  "numResults": 1,
  "results": <Article>[],
};

@GenerateMocks([ArticleRepository])
void main() {
  group(
    'Fetch 7 days favorite articles',
    () {
      test(
        'return Right(Articles) if the http call completes successfully',
        () async {
          final articleRepository = MockArticleRepository();

          when(
            articleRepository.fetchPopularArticles(),
          ).thenAnswer(
            (_) async => Right(
              Articles.fromJson(_mockArticles),
            ),
          );

          expect(
            await articleRepository.fetchPopularArticles(),
            isA<Right>(),
          );
        },
      );

      test(
        'return Left(ServerException) if the http call completes with error',
        () async {
          final articleRepository = MockArticleRepository();

          when(
            articleRepository.fetchPopularArticles(),
          ).thenAnswer(
            (_) async => Left(
              ServerException(message: "message", statusCode: 404),
            ),
          );

          expect(
            await articleRepository.fetchPopularArticles(),
            isA<Left>(),
          );
        },
      );
    },
  );
}
