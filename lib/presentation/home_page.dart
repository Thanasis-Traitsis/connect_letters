import 'package:flutter/material.dart';

import 'circle_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String word = "table";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Letters'),
      ),
      body: CircleContainer(
        word: word.toUpperCase(),
      ),
    );
  }
}
