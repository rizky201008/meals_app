import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick a Category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20, // space between columns
          mainAxisSpacing: 20, // space between rows
        ),
        children: const [
          Text("1"),
          Text("2"),
        ],
      ),
    );
  }
}
