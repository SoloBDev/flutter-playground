import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_arch/feature/daily_news/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity ? article;

  const ArticleWidget({
    super.key,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    if (article == null) {
    return const SizedBox();
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 16, top: 8),
      height: MediaQuery.of(context).size.width / 2.2, // to make the tile height responsive
      child: Row(
        children: [
          _buildImage(context),
          _buildTitleAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if(article == null || article!.urlToImage == null) {
      return _buildPlaceholder(context, const Icon(Icons.broken_image));

    }
    return CachedNetworkImage(
      imageUrl: article?.urlToImage ?? '',
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: .circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover
              )
            ),
          )
        )
      ),
      progressIndicatorBuilder: (context, url, dowloadProgress) => 
        _buildPlaceholder( context, CircularProgressIndicator(
          value: dowloadProgress.progress
        )),
      errorWidget: (context, url, error) => 
        _buildPlaceholder(context, const Icon(Icons.error)),
    );
  }


  // Helper to keep code clean and fix the .circular syntax errors
  Widget _buildPlaceholder(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: ClipRRect(
        borderRadius: .circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08)
          ),
          child: Center(
            child: child,
          )
        ),
      )
    );
  }

  Widget _buildTitleAndDescription() {
    // Expanded: is a widget that expands a child of a Row, Column, 
    //or Flex so that the child fills the available space along the main axis.
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            // title
            Text(
              article!.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 18,
                fontWeight: .w900,
                color: Colors.black87,
              )
            ),

            // description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article!.description ?? '',
                  maxLines: 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(
                  Icons.timeline_outlined, size: 16
                ),
                const SizedBox(width: 4),
                Text(
                  article!.publishedAt ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  )
                )
              ],
            )
          ],
        )
      ),

    );
  }


}