import 'package:flutter/material.dart';
import 'package:note/main.dart';
import 'package:note/pages/add_notes_page.dart';
import 'package:note/providers/note_provider.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          return noteProvider.notes.isEmpty
              ? const Center(
                  child: Text('No notes yet! Add some using the + button.'),
                )
              : ListView.builder(
                  itemCount: noteProvider.notes.length,
                  itemBuilder: (context, index) {
                    final note = noteProvider.notes[index];
                    return Dismissible(
                      key: Key(note.createdAt.toString()),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        noteProvider.deleteNote(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Note deleted')),
                        );
                      },
                      child: ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.content),
                        trailing: Text(
                          "${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
