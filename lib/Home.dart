import 'package:flutter/material.dart';
import 'package:todo/add_todo.dart';
import 'package:todo/update_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Task {
  String title;
  String description;

  Task({required this.title, required this.description});
}

class _HomePageState extends State<HomePage> {
  final List<Task> task = [
    Task(title: 'Task 1', description: 'Description for Task 1'),
    Task(title: 'Task 2', description: 'Description for Task 2'),
    Task(title: 'Task 3', description: 'Description for Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO LIST',
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
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            color: const Color.fromARGB(255, 246, 148, 119),
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: ListTile(
              title: Text(
                task[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                task[index].description,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final updateTask = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateTudo(
                            title: task[index].title,
                            description: task[index].description,
                          ),
                        ),
                      );
                      if (updateTask != null) {
                        setState(() {
                          task[index].title = updateTask.title;
                          task[index].description = updateTask.description;
                        });
                      }
                      print(updateTask.title);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        task.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodo(),
            ),
          );
          // print(newTodo.title);

          if (newTodo != null) {
            setState(() {
              task.add(
                  Task(title: newTodo.title, description: newTodo.description));
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
