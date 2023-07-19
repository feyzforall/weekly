import 'package:go_router/go_router.dart';
import 'package:weekly/features/detail/detail_page.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/features/home/view/home_page.dart';
import 'package:weekly/product/router/routes.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.path(Routes.detail),
      name: Routes.detail,
      builder: (context, state) {
        final Article article = state.extra as Article;
        return DetailPage(article: article);
      },
    ),
  ],
);
