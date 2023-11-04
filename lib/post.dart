// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
