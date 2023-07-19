import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/features/home/repository/article_repository.dart';
import 'package:weekly/features/home/view-model/articles_cubit.dart';

import '../repository/article_repository_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  final mockArticleRepository = MockArticleRepository();
  final articlesCubit = ArticlesCubit(mockArticleRepository);

  test('cubit should have initial state as [ArticlesInitial]', () {
    expect(articlesCubit.state.runtimeType, ArticlesInitial);
  });

  group(
    'get articles',
    () {
      final _mockArticles = {
        "status": "string",
        "copyright": "string",
        "numResults": 1,
        "results": <Article>[],
      };

      blocTest<ArticlesCubit, ArticlesState>(
        'emits [ArticlesLoading, ArticlesLoaded] when '
        'getArticles() is called successfully.',
        setUp: () => when(
          mockArticleRepository.fetchPopularArticles(),
        ).thenAnswer(
          (_) async => Right(
            Articles.fromJson(_mockArticles),
          ),
        ),
        build: () => articlesCubit,
        act: (cubit) => cubit.getArticles(),
        expect: () => [
          isA<ArticlesLoading>(),
          isA<ArticlesLoaded>(),
        ],
      );
    },
  );
}
