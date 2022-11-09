class Article {
  var title;
  var image;
  var author;
  var publishedAt;
  var description;
  Article({
    required this.title,
    required this.image,
    required this.author,
    required this.publishedAt,
    required this.description,
  });
  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
        title: json["title"],
        image: json["urlToImage"],
        author: json["author"],
        publishedAt: json["publishedAt"],
        description: json["description"]);
  }
}