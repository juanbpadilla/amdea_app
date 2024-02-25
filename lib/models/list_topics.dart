import 'dart:convert';

import 'package:amdea_app/models/topic.dart';

class ListTopics {
  List<Topic> data;
  ListTopicsLinks links;
  Meta meta;

  ListTopics({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory ListTopics.fromJson(String str) =>
      ListTopics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListTopics.fromMap(Map<String, dynamic> json) => ListTopics(
        data: List<Topic>.from(json["data"].map((x) => Topic.fromMap(x))),
        links: ListTopicsLinks.fromMap(json["links"]),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "links": links.toMap(),
    "meta": meta.toMap(),
  };
}



class ListTopicsLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;
  String? self;

  ListTopicsLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
    this.self,
  });

  factory ListTopicsLinks.fromJson(String str) => ListTopicsLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListTopicsLinks.fromMap(Map<String, dynamic> json) => ListTopicsLinks(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
    self: json["self"],
  );

  Map<String, dynamic> toMap() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
    "self": self,
  };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": links == null
        ? []
        : List<dynamic>.from(links!.map((x) => x.toMap())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
