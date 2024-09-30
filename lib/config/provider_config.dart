import 'package:flutter/material.dart';
import 'package:note/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => NoteProvider()),
];
