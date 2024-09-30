import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';

class NoteProvider with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(String title, String content) {
    _notes.add(Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    ));
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
