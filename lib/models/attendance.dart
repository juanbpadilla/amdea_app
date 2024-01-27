import 'dart:convert';

class Attendance {
    int id;
    int lessonId;
    String userId;
    int attended;
    DateTime createdAt;
    DateTime updatedAt;
    Lesson lesson;

    Attendance({
        required this.id,
        required this.lessonId,
        required this.userId,
        required this.attended,
        required this.createdAt,
        required this.updatedAt,
        required this.lesson,
    });

    factory Attendance.fromJson(String str) => Attendance.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        lessonId: json["lesson_id"],
        userId: json["user_id"],
        attended: json["attended"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lesson: Lesson.fromMap(json["lesson"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "lesson_id": lessonId,
        "user_id": userId,
        "attended": attended,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "lesson": lesson.toMap(),
    };
}

class Lesson {
    int id;
    String lesson;
    DateTime fecha;
    String inicio;
    String fin;
    int courseId;
    DateTime createdAt;
    DateTime updatedAt;

    Lesson({
        required this.id,
        required this.lesson,
        required this.fecha,
        required this.inicio,
        required this.fin,
        required this.courseId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Lesson.fromJson(String str) => Lesson.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Lesson.fromMap(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        lesson: json["lesson"],
        fecha: DateTime.parse(json["fecha"]),
        inicio: json["inicio"],
        fin: json["fin"],
        courseId: json["course_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "lesson": lesson,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "inicio": inicio,
        "fin": fin,
        "course_id": courseId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
