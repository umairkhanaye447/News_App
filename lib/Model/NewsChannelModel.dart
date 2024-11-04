// To parse this JSON data, do
//
//     final newsChannelModel = newsChannelModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewsChannelModel newsChannelModelFromJson(String str) =>
    NewsChannelModel.fromJson(json.decode(str));

String newsChannelModelToJson(NewsChannelModel data) =>
    json.encode(data.toJson());

class NewsChannelModel {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsChannelModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsChannelModel copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) =>
      NewsChannelModel(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  factory NewsChannelModel.fromJson(Map<String, dynamic> json) =>
      NewsChannelModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  final Source source;
  final Author author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Article copyWith({
    Source? source,
    Author? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) =>
      Article(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] != null
            ? authorValues.map[json["author"]] ?? Author.BBC_NEWS
            : Author.BBC_NEWS, // default or placeholder value if null
        title: json["title"] ?? 'No Title',
        description: json["description"] ?? 'No Description',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: json["publishedAt"] != null
            ? DateTime.parse(json["publishedAt"])
            : DateTime.now(), // default to current date if missing
        content: json["content"] ?? 'No Content',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": authorValues.reverse[author],
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

enum Author { BBC_NEWS }

final authorValues = EnumValues({"BBC News": Author.BBC_NEWS});

class Source {
  final String id; // Assuming ID can be a String, adjust if necessary
  final String name; // Use String for the name

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? '', // Use a default or empty string if null
        name: json["name"] ?? '', // Use a default or empty string if null
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

enum Id { BBC_NEWS }

final idValues = EnumValues({"bbc-news": Id.BBC_NEWS});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
