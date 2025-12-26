import 'package:dio/dio.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticlesState({
    this.articles,
    this.error,
  });

  // Equatable props
  @override
  List<Object?> get props => [articles!, error!];
}


class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError( DioException error) : super(error: error);
}