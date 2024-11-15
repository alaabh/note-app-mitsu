import 'package:flutter/material.dart';

import '../widgets/label.dart';
import 'sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.forward().whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [Color(0xff2F58CD), Color(0xff3A1078)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: FadeTransition(
                opacity: _animation,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const LabelTxt(
                          text: 'Notes',
                          size: 48.0,
                          fn: FontWeight.w600,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                        ),
                        const LabelTxt(
                          text: 'Welcome Back !',
                          size: 40.0,
                          fn: FontWeight.w600,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        const LabelTxt(
                          text: 'Connect now and get in touch with US',
                          size: 16.0,
                          fn: FontWeight.w600,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
