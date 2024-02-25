import 'dart:convert';

class Topic {
  String type;
  String id;
  Attributes attributes;
  Relationships? relationships;
  DatumLinks? links;

  Topic({
    required this.type,
    required this.id,
    required this.attributes,
    this.relationships,
    this.links,
  });

  factory Topic.fromJson(String str) => Topic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
        type: json["type"],
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
        relationships: json["relationships"] == null
            ? null
            : Relationships.fromMap(json["relationships"]),
        links: json["links"] == null ? null : DatumLinks.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "attributes": attributes.toMap(),
        // "relationships": relationships?.toMap(),
        // "links": links?.toMap(),
      };

  Topic copy() => Topic(
      type: type,
      id: id,
      attributes: attributes,
      relationships: relationships,
      links: links);
}

class Attributes {
  String name;
  String description;

  Attributes({
    required this.name,
    required this.description,
  });

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "description": description
  };
}

class DatumLinks {
  String self;

  DatumLinks({
    required this.self,
  });

  factory DatumLinks.fromJson(String str) =>
      DatumLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumLinks.fromMap(Map<String, dynamic> json) => DatumLinks(
        self: json["self"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
      };
}

class Relationships {
  Course course;

  Relationships({
    required this.course,
  });

  factory Relationships.fromJson(String str) =>
      Relationships.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Relationships.fromMap(Map<String, dynamic> json) => Relationships(
        course: Course.fromMap(json["course"]),
      );

  Map<String, dynamic> toMap() => {
        "course": course.toMap(),
      };
}

class Course {
  CourseLinks? links;
  // CourseData? data;

  Course({
    this.links,
    // this.data,
  });

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        links: json["links"] == null ? null : CourseLinks.fromMap(json["links"]),
        // data: json["data"] == null ? null : CourseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "links": links?.toMap(),
    // "data": data?.toMap(),
  };
}

class CourseLinks {
  String self;
  String related;

  CourseLinks({
    required this.self,
    required this.related,
  });

  factory CourseLinks.fromJson(String str) =>
      CourseLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseLinks.fromMap(Map<String, dynamic> json) => CourseLinks(
        self: json["self"],
        related: json["related"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "related": related,
      };
}

class CourseData {
  String id;

  CourseData({
    required this.id,
  });

  factory CourseData.fromJson(String str) =>
      CourseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseData.fromMap(Map<String, dynamic> json) => CourseData(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}
