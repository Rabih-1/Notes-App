import 'package:flutter/material.dart';

class ShowNotes extends StatefulWidget {
  final List<String> notes;

  ShowNotes(this.notes);

  @override
  _ShowNotesState createState() => _ShowNotesState();
}

class _ShowNotesState extends State<ShowNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Show Notes'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[600],
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: widget.notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.notes[index],
                              style:const TextStyle(fontSize: 16.0),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.notes.removeAt(index);
                              });
                            },
                            child:const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.notes.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                padding:const EdgeInsets.all(25),
              ),
              child: const Text('Clear All'),
            ),
          ),
        ],
      ),
    );
  }
}
