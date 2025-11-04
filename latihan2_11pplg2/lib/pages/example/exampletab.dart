import 'package:flutter/material.dart';

class ExampleTab extends StatelessWidget {
  const ExampleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example Tab Page")),
      body: const Center(child: Text("ini adalah Example Tab Page")),
    );
  }
}
