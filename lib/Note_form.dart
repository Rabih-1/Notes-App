import 'package:flutter/material.dart';

class NoteForm extends StatefulWidget { //noteform
  final List<String> notes;

  NoteForm(this.notes);

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _noteController,
            decoration: const InputDecoration(
              labelText: 'Enter your note',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a note';
              }
              return null;
            },

          ),
          const  SizedBox(height: 20),
          ElevatedButton(
            style:  ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String enteredNote = _noteController.text;
                setState(() {
                  widget.notes.add(enteredNote);
                  _noteController.clear();
                });
              }
            },
            child:const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}