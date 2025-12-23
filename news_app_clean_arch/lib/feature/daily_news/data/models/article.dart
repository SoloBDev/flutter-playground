import 'package:news_app_clean_arch/feature/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int ? id,
    String ? author,
    String ? title,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,

  });


  // Create a Factory method to parse json data and return ArticleModel object, using "From Json" convention
  // What is a factory constructor in Dart?
  // A factory constructor is a special type of constructor that can return an instance of the class or a subclass,
  // rather than always creating a new instance of the class.
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}

// what is the dynamic type in dart?
// In Dart, dynamic is a special type that can hold any value and bypasses
// static type checking. when a variable is declared as dynamic, it can be assigned any type of value.
