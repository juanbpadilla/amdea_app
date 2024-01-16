// import 'dart:convert';

class Libro {
    int id;
    String lesson;
    String title;
    String? link;
    DateTime createdAt;
    DateTime updatedAt;

    Libro({
        required this.id,
        required this.lesson,
        required this.title,
        this.link,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Libro.fromJson(Map<String, dynamic> json) {
      return Libro(
        id: json['id'],
        lesson: json['lesson'],
        title: json['title'],
        link: json['link'] ?? '',
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
    }

    // factory Libro.fromJson(String str) => Libro.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    // factory Libro.fromMap(Map<String, dynamic> json) => Libro(
    //     id: json["id"],
    //     title: json["title"],
    //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    // );

    // Map<String, dynamic> toMap() => {
    //     "id": id,
    //     "title": title,
    //     "created_at": createdAt?.toIso8601String(),
    //     "updated_at": updatedAt?.toIso8601String(),
    // };
}
