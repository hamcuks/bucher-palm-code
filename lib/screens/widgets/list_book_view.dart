import 'package:bucher_palm_code/blocs/add_my_books/add_my_books_bloc.dart';
import 'package:bucher_palm_code/blocs/get_book/get_book_bloc.dart';
import 'package:bucher_palm_code/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'book_card.dart';

class ListBookView extends StatelessWidget {
  final bool isFavorite;

  const ListBookView({super.key, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBookBloc, GetBookState>(
      bloc: sl<GetBookBloc>()..add(GetBookProccessed(isFavorite: isFavorite)),
      buildWhen: (previous, current) => previous != current,
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

        /// Display empty message if the items is empty
        if (state.items.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.folder_open),
                SizedBox(height: 8),
                Text("There is no books!"),
              ],
            ),
          );
        }

        /// Otherwise, display the book data
        return BlocListener<AddMyBooksBloc, AddMyBooksState>(
          listener: (context, myBookState) {
            if (myBookState.status.isError || myBookState.status.isSuccess) {
              sl<GetBookBloc>().add(GetBookProccessed(isFavorite: isFavorite));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(myBookState.message!),
                ),
              );
            }
          },
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => BookCard(
              data: state.items.elementAt(index),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: state.items.length,
          ),
        );
      },
    );
  }
}
