import 'package:bucher_palm_code/blocs/get_book/get_book_bloc.dart';
import 'package:bucher_palm_code/injector.dart';
import 'package:bucher_palm_code/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'app_input_form.dart';
import 'book_card.dart';

class ListBookView extends StatefulWidget {
  final bool isFavorite;

  const ListBookView({super.key, this.isFavorite = false});

  @override
  State<ListBookView> createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> {
  static const _pageSize = 32;
  int pageKey = 1;
  String? search;

  final PagingController<int, BookModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    /// Add pageing controller listener
    ///
    /// If there's any changes, call the GetBookProccessed event to get the new data
    _pagingController.addPageRequestListener((pageKey) {
      this.pageKey = pageKey;
      sl<GetBookBloc>().add(GetBookProccessed(
        page: pageKey,
        isFavorite: widget.isFavorite,
        search: search,
      ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppInputForm(
            hintText: "Find Books",
            onChanged: (val) {
              search = val;
              _pagingController.refresh();
            },
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: BlocConsumer<GetBookBloc, GetBookState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                try {
                  /// Check is the current page is last page or not
                  final items = state.items;
                  final isLastPage = items.length < _pageSize;

                  /// If last page, then append the items into last page of
                  /// paging controller
                  if (isLastPage) {
                    _pagingController.appendLastPage(items);
                  } else {
                    /// Otherwise, append the items with the next page
                    final nextPageKey = pageKey + 1;

                    _pagingController.appendPage(items, nextPageKey);
                  }
                } catch (e) {
                  /// Trigger paging controller error if error occurred
                  _pagingController.error = e;
                }
              }
            },
            builder: (context, state) {
              return PagedListView<int, BookModel>.separated(
                pagingController: _pagingController,
                padding: const EdgeInsets.all(16),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                builderDelegate: PagedChildBuilderDelegate<BookModel>(
                  /// Show book card loading when refreshing new page
                  /// or load more item
                  newPageProgressIndicatorBuilder: (_) => const Skeletonizer(
                    child: BookCard(),
                  ),

                  /// Display empty message if the items is empty
                  noItemsFoundIndicatorBuilder: (_) => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open),
                        SizedBox(height: 8),
                        Text("There is no books!"),
                      ],
                    ),
                  ),

                  /// Display error message if error occurred
                  newPageErrorIndicatorBuilder: (_) => Center(
                    child: Text(
                      _pagingController.error ?? "An error occurred!",
                    ),
                  ),

                  /// Display book card loading animation for the first time
                  firstPageProgressIndicatorBuilder: (_) => Skeletonizer(
                    child: Column(
                      children: List.generate(
                        10,
                        (index) => const Column(
                          children: [
                            BookCard(),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Display the fetched book items
                  itemBuilder: (context, item, index) {
                    return BookCard(
                      data: item,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
