import 'package:bucher_palm_code/screens/widgets/app_input_form.dart';
import 'package:bucher_palm_code/screens/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bucher",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                AppInputForm(
                  hintText: "Find Books",
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
