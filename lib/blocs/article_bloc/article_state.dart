// initial

// ArticlesInitial
// ArticlesLoading
// ArticlesLoaded
// ArticlesError

import 'package:miniblog/models/blog.dart';

abstract class ArticleState {}

class ArticlesInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  List<Blog> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticlesError extends ArticleState {}
