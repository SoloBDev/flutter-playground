
import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/core/usecases/usecase.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/repository/article_repository.dart';

// UseCase to get all articles, the generic type is DataState<List<ArticleEntity>> that 
// the value return by the call function is the article entity list wrapped in DataState.
// and in Params, we don't need any parameter to get all articles, so we use void.
class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {

  // ArticleRepository instance to fetch articles.
  final ArticleRepository _articleRepository;

  // Constructor to initialize the ArticleRepository that is injected.
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getAllArticles();

  }
  
}