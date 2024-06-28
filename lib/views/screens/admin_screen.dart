import 'package:flutter/material.dart';
import 'package:lesson_65_1/controllers/user_controller.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    final userController = context.watch<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: userController.user == null
          ? Center(
              child: Text("Boshimni og'ritma!!!"),
            )
          : ListView.builder(
              itemCount: 3,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(userController.user!.name),
                  leading: userController.user == null
                      ? const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/profile.png"),
                        )
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(userController.user!.imageUrl),
                        ),
                );
              }),
    );
  }
}
