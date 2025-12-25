import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getAllArticles();

  // before we implement the repository interface, 
  // we need to create the model class for article entity
}