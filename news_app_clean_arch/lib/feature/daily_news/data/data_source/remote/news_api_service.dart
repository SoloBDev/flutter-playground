import 'package:dio/dio.dart';
//because retrofit use part file to generate code we need to import it here
import 'package:news_app_clean_arch/core/constants/constants.dart';
import 'package:news_app_clean_arch/feature/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
// what this file will do?, it will define all the api endpoints and their respective methods
part 'news_api_service.g.dart';

//this class handle all the network call methods
// we will annotate it with @RestApi and provide the base url of the api
// @restApi is from retrofit package that help us to generate the api service implementation
// and also help us to define the api endpoints and their respective methods
@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  // we will create a factory constructor that accepts a Dio instance
  factory NewsApiService(Dio dio) = _NewsApiService;

  // define an retrofit http annotation for get request to fetch news articles.
  @GET('/top-headlines')
  // when calling this method we pass the required query parameters to it.
  // in this abstr acted method we're basically telling the retrofit to generate a method for us
  // that can internally uses the dio instance to make a get network call to an endpoint /top-headlines
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String ? apiKey,
    @Query('country') String ? country,
    @Query('category') String ? category,
  });

  // define a method to get all articles from the news api

}