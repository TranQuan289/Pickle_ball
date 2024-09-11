class NewsModel {
  final int id;
  final String newsTitle;
  final String newsContent;
  final bool newsArticleStatus;
  final int newsType;
  final String imageUrl;

  NewsModel({
    required this.id,
    required this.newsTitle,
    required this.newsContent,
    required this.newsArticleStatus,
    required this.newsType,
    required this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      newsTitle: json['newsTitle'],
      newsContent: json['newsContent'],
      newsArticleStatus: json['newsArticleStatus'],
      newsType: json['newsType'],
      imageUrl: json['imageUrl'],
    );
  }
}
