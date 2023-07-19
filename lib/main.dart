import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly/features/home/view-model/articles_cubit.dart';
import 'package:weekly/product/router/router.dart';
import 'package:weekly/product/utils/dependency_injection.dart';

void main() {
  // Dependency Injection
  setup();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt.get<ArticlesCubit>(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weekly',
      routerConfig: router,
    );
  }
}
