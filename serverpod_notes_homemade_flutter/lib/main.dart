import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_notes_homemade_client/serverpod_notes_homemade_client.dart';
import 'package:serverpod_notes_homemade_flutter/loading_screen.dart';
import 'package:serverpod_notes_homemade_flutter/note_dialog.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Note>? _notes;
  Exception? _connectionException;

  void _connectionFailed(dynamic exception) {
    setState(() {
      _notes = null;
      _connectionException = exception;
    });
  }

  Future<void> _loadNotes() async {
    try {
      final notes = await client.notes.getAllNotes();
      setState(() {
        _notes = notes;
        _connectionException = null;
      });
    } catch (e) {
      _connectionFailed(e);
    } // try
  }

  Future<void> _createNote(Note note) async {
    try {
      await client.notes.createNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _updateNote(Note note) async {
    try {
      await client.notes.updateNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _deleteNote(Note note) async {
    try {
      await client.notes.deleteNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _notes == null
          ? LoadingScreen(
              exception: _connectionException,
              onTryAgain: _loadNotes,
            )
          : ListView.builder(
              itemCount: _notes!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showNoteDialog(
                      context: context,
                      text: _notes![index].text,
                      onSaved: (text) {
                        var note = _notes![index];
                        note.text = text;
                        _updateNote(note);
                      },
                    );
                  },
                  title: Text(_notes![index].text),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      var note = _notes![index];
                      setState(() {
                        _notes!.remove(note);
                      });
                      _deleteNote(note);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: _notes == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                showNoteDialog(
                  context: context,
                  onSaved: (text) {
                    var note = Note(text: text);
                    _notes!.add(note);
                    _createNote(note);
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  } // build
} // class MyHomePageState
