// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Note {
  String title;
  String content;
  DateTime createdAt;
  Note({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  Note copyWith({
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return Note(
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Note(title: $title, content: $content, createdAt: $createdAt)';

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ createdAt.hashCode;
}
