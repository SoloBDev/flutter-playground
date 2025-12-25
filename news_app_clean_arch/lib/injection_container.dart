// Dependency injections using get_it
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_arch/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app_clean_arch/feature/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_arch/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializedDependencies() async {
  // Dio instance
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(
    NewsApiService(sl())
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl())
  );


}