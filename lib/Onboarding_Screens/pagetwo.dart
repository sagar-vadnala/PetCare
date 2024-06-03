import 'package:flutter/material.dart';

class Pagetwo extends StatelessWidget {
  const Pagetwo({super.key});

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
              child: Image.asset("assets/onboard2.png")
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
            child: Text("Our platform makes it easy for you to search, connect, and adopt your furry soulmate. ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6C6868)
            ),
            ),
          ),
        ],
      ),
    );
  }
}