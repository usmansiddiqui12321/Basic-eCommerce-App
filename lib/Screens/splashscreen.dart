import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/login_screen/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: Scaffold(
        
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150,),
            Center(
              child: Container(
                 child: const Text("DSA PROJECT",style: TextStyle(fontSize: 30),),
                 height: 250,
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("images/2.gif",
                      ),
      
                    
                    ),
                  ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
