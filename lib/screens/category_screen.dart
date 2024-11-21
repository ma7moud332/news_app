import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_bulider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBulider(
            category:category ,
          ),
        ],
      ),
    );
  }
}
