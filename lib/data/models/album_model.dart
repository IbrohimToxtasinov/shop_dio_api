class AlbumModel {
  final int userId;
  final int id;
  final String title;

  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json["userId"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
    );
  }
}

