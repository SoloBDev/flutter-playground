import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/feature/daily_news/data/models/article.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getAllArticles() {
    // TODO: implement getAllArticles
    throw UnimplementedError();
  }

}