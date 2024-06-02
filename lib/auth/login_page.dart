import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login!!!"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Center(
          child: Column(
            children: [
              Text("Feature under development",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
               Text("Go back and click login later to visit home page",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}