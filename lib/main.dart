import 'package:flutter/material.dart';
import 'package:project01/show_notes.dart';
import 'add_notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(notes),
        '/showNotes': (context) => ShowNotes(notes),
        '/addNotes': (context) => AddNotes(notes),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final List<String> notes;

   MainPage(this.notes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Application'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[600],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addNotes');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.black,
                ),
                child:const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('Add Note'),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/showNotes');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.black,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.notes),
                    SizedBox(width: 10),
                    Text('Show Notes'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





