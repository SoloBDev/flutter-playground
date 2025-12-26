import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      
      );
  
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700
          
        )
        ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState> (
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticlesError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteArticlesDone) {
          final articles = state.articles!
            .where((article) => article != null)
            .toList();
          return ListView.builder(
            itemBuilder: (context, index) {
              debugPrint('Articles: ${articles[index]}');
              return ArticleWidget(
                article: articles[index],
              );
            },
            itemCount: articles.length,

            );
        }
        return const SizedBox();
      },
    );
  }
  
}