// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lesson_65_1/controllers/user_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

  void _saveName(UserController userController) {
    String name = _nameController.text;
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'Enter your imageUrl',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  userController.update(name, _imageController.text);
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    final userController = context.watch<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: userController.user == null
                  ? const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/profile.png"),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          NetworkImage(userController.user!.imageUrl),
                    ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveName(userController);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
