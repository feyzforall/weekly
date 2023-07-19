part of 'articles_cubit.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final Articles articles;

  const ArticlesLoaded(this.articles);
}

class ArticlesError extends ArticlesState {
  final String message;

  const ArticlesError(this.message);
}
