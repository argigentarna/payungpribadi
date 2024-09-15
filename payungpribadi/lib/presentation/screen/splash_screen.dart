// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    main();
  }

  @override
  void dispose() {
    super.dispose();
  }

  main() async {
    await Future.delayed(const Duration(seconds: 1));

    Navigator.of(context).pushReplacementNamed("/main_screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          "Payuung",
          style: logoTextStyle,
        ),
      ),
    );
  }
}
