

import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color backGro = const Color(0xFFB71C1C) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGro,
        title:  const Center(
          child: Text('Profile' ,  style: TextStyle(
            color: Colors.white,
            fontSize: 29,
          ),),
        ),
      ),
      body: Center(
        child: Container(
          child: const Text('Hello Profile'),
        ),
      ),
    );
  }
}