import 'package:cat_facts/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/cat_splash.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height,
        animate: true,
        onLoaded: (composition) {
          _controller!
            ..duration = composition.duration
            ..forward().whenComplete(() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                ));
        },
      ),
    );
  }
}
