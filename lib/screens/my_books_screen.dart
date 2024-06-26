import 'package:flutter/material.dart';

import 'widgets/book_card.dart';

class MyBooksScreen extends StatelessWidget {
  const MyBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "My Books",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => const BookCard(),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: 32,
            ),
          ),
        ],
      ),
    );
  }
}
