import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile/screens/add_page.dart';
import 'package:http/http.dart' as http;

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Yohannes',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${DateTime.now().toString().substring(0, 10)}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: navigateToAddPage,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final id = item['id'] as String;
                return ListTile(
                  leading: Container(
                      width: 10,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      )),

                  // leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'edit') {
                        // navigateToEditPage(item);
                      } else if (value == 'delete') {
                        deleteById(id);
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text('Edit'),
                          value: 'edit',
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          value: 'delete',
                        ),
                      ];
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

// void navigateToEditPage(Map item) {
//     final route = MaterialPageRoute(
//       builder: (context) => const AddToPage(todo: item,),
//     );
//     Navigator.push(context, route).then((_) {
//       fetchTodo();
//     });
//   }
  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => const AddToPage(),
    );
    Navigator.push(context, route).then((_) {
      fetchTodo();
    });
  }

  Future<void> deleteById(String id) async {
    final url = 'https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered = items.where((element) => element['id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      showErrorMessage('Unable to delete');
    }
  }

  Future<void> fetchTodo() async {
    final url = 'https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        items = List<Map<String, dynamic>>.from(json);
      });
    } else {
      showErrorMessage('Unable to fetch data');
    }
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
