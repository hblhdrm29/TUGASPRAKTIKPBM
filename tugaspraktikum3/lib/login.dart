import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key:key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SafeArea(
       child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.waving_hand,
            size: 200,
        ),
        SizedBox(height:50),
        //Hai!
        Text(
          'Hai!',
          style: GoogleFonts.bebasNeue(
            fontSize: 54,
          ),
          ),
          SizedBox(height:10),
          Text(
          'Selamat datang kembali!',
          style: TextStyle(
            fontSize: 21,
            ),
          ),
        SizedBox(height:50),
        
        //Email
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height:15),


        //Password
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height:15),

        //sign in
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(
            padding: EdgeInsets.all(25) ,
            decoration: BoxDecoration(color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height:25),

        //not a member ? register now
        Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text(
              'Not a member ?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Register now',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
             )
            )
          ],
        ),
        
      ],
        ),
       ),
      ),
    );
  }
}