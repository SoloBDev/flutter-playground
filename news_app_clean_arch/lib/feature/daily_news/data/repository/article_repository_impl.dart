import 'dart:io';
import 'package:dio/dio.dart'; // Ensure Dio is imported at the top
import 'package:news_app_clean_arch/core/constants/constants.dart';
import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app_clean_arch/feature/daily_news/data/models/article.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getAllArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        // Constructing DioException for non-200 responses
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse, // Updated from DioErrorType.response
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      // Catching actual network failures (e.g., timeout, no internet)
      return DataFailed(e);
    }
  }
}