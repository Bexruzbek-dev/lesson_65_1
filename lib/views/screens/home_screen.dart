import 'package:flutter/material.dart';
import 'package:lesson_65_1/controllers/user_controller.dart';
import 'package:lesson_65_1/views/screens/admin_screen.dart';
import 'package:lesson_65_1/views/screens/profile_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return ProfileScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
        title: const Text(
          "Home Screen",
        ),
      ),
      body: Center(
        child: Consumer<UserController>(
            builder: (context, userController, Widget) {
          return userController.user == null
              ? const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/profile.png"),
                )
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(userController.user!.imageUrl),
                );
        }),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return AdminScreen();
              }));
            },
            child: Text("Admin Panel"),
          ),
        ],
      )),
    );
  }
}
