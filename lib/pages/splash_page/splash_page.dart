import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_app/pages/pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
 late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    Timer(Duration(seconds: 3), () {
      _controller.forward().then(
        (_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProductListPage()),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.transparent,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
                  'assets/logo.png',
                  scale: 1,
                ),
        ),
        
    
      ),
    );
  }
}
