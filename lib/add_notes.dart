import 'package:flutter/material.dart';

import 'Note_form.dart';


class AddNotes extends StatefulWidget {
  final List<String> notes;

  AddNotes(this.notes);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add Note'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[600],
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: NoteForm(widget.notes),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}

