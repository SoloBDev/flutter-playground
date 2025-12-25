import 'package:dio/dio.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticleState({
    this.articles,
    this.error,
  });

  // Equatable props
  @override
  List<Object?> get props => [articles!, error!];
}


abstract class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

abstract class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> articles) : super(articles: articles);
}

abstract class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError( DioException error) : super(error: error);
}