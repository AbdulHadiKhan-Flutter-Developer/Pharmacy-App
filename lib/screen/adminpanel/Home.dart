import 'package:flutter/material.dart';
import 'package:hoormedicalstore/widget/admin_app_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
        title: Text('Admin Panel'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      drawer: AdminAppDrawer(),
    );
  }
}
