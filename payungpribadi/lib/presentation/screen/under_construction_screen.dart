import 'package:flutter/material.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Under construction..'),
          ),
        ],
      ),
    );
  }
}
