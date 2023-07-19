import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/features/home/view-model/articles_cubit.dart';
import 'package:weekly/features/home/view/article_card.dart';
import 'package:weekly/product/constants/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ArticlesCubit>(context, listen: false).getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Weekly'),
      ),
      body: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ArticlesLoaded) {
            return HomeView(articles: state.articles);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.articles});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.pagePadding.top),
      child: ListView.builder(
        itemCount: articles.results?.length,
        itemBuilder: (BuildContext context, int index) {
          final Article article = articles.results![index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: Dimensions.smallPadding.bottom,
            ),
            child: ArticleCard(
              article: article,
            ),
          );
        },
      ),
    );
  }
}
