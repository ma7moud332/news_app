import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_list_view.dart';
import '../services/news_service.dart';

class NewsListViewBulider extends StatefulWidget {
  const NewsListViewBulider({super.key, required this.category});

  final String category;
  @override
  State<NewsListViewBulider> createState() => _NewsListViewBuliderState();
}

class _NewsListViewBuliderState extends State<NewsListViewBulider> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return NewsListView(
              articles: snapShot.data!,
            );
          } else if (snapShot.hasError) {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text('Oops There was an error, Try Later'),
              ),
            );
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
