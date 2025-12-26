import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch/config/theme/app_themes.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_clean_arch/injection_container.dart';

void main() async {
  await initializedDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // why make const the material app?, because it improves performance by reducing unnecessary rebuilds.
    return BlocProvider<RemoteArticlesBloc>(
      // create the bloc using the service locator, this makes the bloc available throughout the app
      // create:(context) => BlocProvider.of<RemoteArticlesBloc>(context)..add(GetArticles()), // make it on the optimized way
      create: (context) => sl()..add(const GetArticles()), // why use sl() here?, because it is the service locator that provides the instance of the bloc., and also why make get articles event const?, because it is a stateless event and it improves performance by reducing unnecessary rebuilds.
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        theme: theme(), // why not use const on material app because of theme data?, because theme data is not a constant expression.
        home: const DailyNews(), // why make const the daily news page?, because it is a stateless widget and it improves performance by reducing unnecessary rebuilds.
      ),
    );
  }
}
