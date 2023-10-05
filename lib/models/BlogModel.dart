class BlogModel {
  final String id;
  final String title;
  final String imageUrl;
  final String content;

  BlogModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      imageUrl: json['image_url'] ?? "",
      content: json['content'] ?? "",
    );
  }
}
