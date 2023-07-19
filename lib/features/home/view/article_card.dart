import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/product/router/routes.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: Image.network(
        article.imageUrl,
        width: 45,
        height: 45,
      ),
      title: Text(article.title.toString()),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(article.subtitle.toString()),
          const SizedBox(height: 10),
          Text(article.publishedDate.toString()),
        ],
      ),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () => context.pushNamed(
        Routes.detail,
        extra: article,
      ),
    );
  }
}
