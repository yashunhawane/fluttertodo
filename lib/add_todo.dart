import 'package:flutter/material.dart';

class Todo {
  String title;
  String description;

  Todo({required this.title, required this.description});
}

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            wordSpacing: 3,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  errorText: _errorText != null && _titleController.text.isEmpty
                      ? 'Please enter a title'
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  errorText:
                      _errorText != null && _descriptionController.text.isEmpty
                          ? 'Please enter a description'
                          : null,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String description = _descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  Todo newTodo = Todo(title: title, description: description);
                  Navigator.pop(context, newTodo);
                } else {
                  setState(() {
                    _errorText = 'Please fill in all fields.';
                  });
                }
              },
              child: const Text(
                'Add Todo',
                style: TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
