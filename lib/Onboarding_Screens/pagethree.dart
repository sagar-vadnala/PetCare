import 'package:dog_assignment/auth/login_page.dart';
import 'package:dog_assignment/pages/home_page.dart';
import 'package:dog_assignment/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagethree extends StatelessWidget {
  const Pagethree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 82, left: 4, right: 8),
            child: SizedBox(
              height: 362,
              width: double.infinity,
              child: Image.asset("assets/onboard3.png")
            ),
          ),
          SizedBox(height: 38,),
          Text("Discover Your Perfect Match",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFFEA4A6A)
          ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Our platform makes it easy for you to \nsearch, connect, and adopt your furry \n                         soulmate. ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6C6868)
            ),
            ),
          ),
          SizedBox(height: 30,),
          // ElevatedButton(onPressed: () {
          //   Navigator.push(context, CupertinoPageRoute(builder: (_) => HomePage()));
          // }, child: Text("data"))
          MyButton(text: "Login to continue  >",
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => LoginPage()));
          },
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => HomePage()));
            },
            child: Text("Login Later",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            ),
          )
        ],
      ),
    );
  }
}