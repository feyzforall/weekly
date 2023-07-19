import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/features/home/repository/article_repository.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.articleRepository) : super(ArticlesInitial());

  final ArticleRepository articleRepository;

  Future<void> getArticles() async {
    emit(ArticlesLoading());
    final response = await articleRepository.fetchPopularArticles();
    response.fold(
      (l) => emit(
        ArticlesError(
          l.message.toString(),
        ),
      ),
      (r) => emit(
        ArticlesLoaded(r),
      ),
    );
  }
}
