import 'package:flutter/material.dart';
import 'package:note/app.dart';
import 'package:note/pages/notes_page.dart';
import 'package:note/providers/note_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
