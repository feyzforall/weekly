import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly/features/home/view-model/articles_cubit.dart';
import 'package:weekly/features/home/view/home_page.dart';
import 'package:weekly/product/utils/dependency_injection.dart';

void main() {
  // Dependency Injection
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<ArticlesCubit>(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
