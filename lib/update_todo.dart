import 'package:flutter/material.dart';

// Define the Task class
class Task {
  String title;
  String description;

  Task({required this.title, required this.description});
}

class UpdateTudo extends StatefulWidget {
  final String title;
  final String description;

  UpdateTudo({required this.title, required this.description});

  @override
  State<UpdateTudo> createState() => _UpdateTudoState();
}

class _UpdateTudoState extends State<UpdateTudo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Todo',
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
                decoration: const InputDecoration(
                  labelText: 'Title',
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
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                String updatedTitle = _titleController.text;
                String updatedDescription = _descriptionController.text;

                if (updatedTitle.isNotEmpty && updatedDescription.isNotEmpty) {
                  Task updatedTask = Task(
                    title: updatedTitle,
                    description: updatedDescription,
                  );

                  Navigator.pop(context, updatedTask);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please fill in all fields.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                'Update Todo',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
