import 'package:bucher_palm_code/blocs/get_book/get_book_bloc.dart';
import 'package:bucher_palm_code/screens/widgets/app_input_form.dart';
import 'package:bucher_palm_code/screens/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../injector.dart';

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
                  "Books",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                AppInputForm(
                  hintText: "Find Books",
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<GetBookBloc, GetBookState>(
              bloc: sl<GetBookBloc>()..add(GetBookProccessed()),
              builder: (context, state) {
                /// Display error message if error occurred
                if (state.status.isError) {
                  return const Center(
                    child: Text("An error occurred!"),
                  );
                } else if (state.status.isLoading || state.status.isInitial) {
                  /// Display shimmer loading animation if the status is initial or loading
                  return Skeletonizer(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) => const BookCard(),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemCount: 32,
                    ),
                  );
                }

                /// Otherwise, display the book data
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) => BookCard(
                    data: state.items.elementAt(index),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: state.items.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
