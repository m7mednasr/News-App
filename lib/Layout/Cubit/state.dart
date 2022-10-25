abstract class NewsState {}

class IntialNewsApp extends NewsState {}

class NewsBottomNavApp extends NewsState {}

class NewsLoadingApp extends NewsState {}

class NewsBusinessSuccess extends NewsState {}

class NewsBusinessErorr extends NewsState {
  final String? erorr;

  NewsBusinessErorr(this.erorr);
}

class NewsSportsLoadingApp extends NewsState {}

class NewsSportsSuccess extends NewsState {}

class NewsSportsErorr extends NewsState {
  final String? erorr;

  NewsSportsErorr(this.erorr);
}

class NewsScienceLoadingApp extends NewsState {}

class NewsScienceSuccess extends NewsState {}

class NewsScienceErorr extends NewsState {
  final String? erorr;

  NewsScienceErorr(this.erorr);
}

class NewsSerachLoadingApp extends NewsState {}

class NewsSerachSuccess extends NewsState {}

class NewsSerachErorr extends NewsState {
  final String? erorr;

  NewsSerachErorr(this.erorr);
}
