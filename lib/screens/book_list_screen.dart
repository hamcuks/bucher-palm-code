import 'package:bucher_palm_code/blocs/get_book/get_book_bloc.dart';
import 'package:bucher_palm_code/screens/widgets/app_input_form.dart';
import 'package:bucher_palm_code/screens/widgets/list_book_view.dart';
import 'package:flutter/material.dart';

import '../injector.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Books",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                AppInputForm(
                  hintText: "Find Books",
                  onChanged: (val) => sl<GetBookBloc>().add(
                    GetBookProccessed(search: val),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ListBookView(),
          ),
        ],
      ),
    );
  }
}
