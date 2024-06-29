import 'dart:async';

import 'package:bucher_palm_code/blocs/get_book/get_book_bloc.dart';
import 'package:bucher_palm_code/injector.dart';
import 'package:bucher_palm_code/models/book_model.dart';
import 'package:bucher_palm_code/services/database_manager.dart';
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
  static const _pageSize = 10;
  int _pageKey = 1;

  final PagingController<int, BookModel> _pagingController =
      PagingController(firstPageKey: 1);
  late final TextEditingController _searchController;
  late final StreamSubscription<void> _isarListener;

  @override
  void initState() {
    /// Add pageing controller listener
    ///
    /// If there's any changes, call the GetBookProccessed event to get the new data
    _pagingController.addPageRequestListener((pageKey) {
      _pageKey = pageKey;
      sl<GetBookBloc>().add(GetBookProccessed(
        page: pageKey,
        pageSize: _pageSize,
        isFavorite: widget.isFavorite,
        search: _searchController.text,
      ));
    });

    _searchController = TextEditingController();

    /// Watch Books collection
    final listener =
        sl<DatabaseManager>().isar.Books.watchLazy(fireImmediately: true);

    /// Refresh paging controller when book collection changed
    _isarListener = listener.listen((_) {
      _pagingController.refresh();
    });

    super.initState();
  }

  @override
  void dispose() {
    _isarListener.cancel();
    _pagingController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppInputForm(
            controller: _searchController,
            hintText: "Find Books",
            onFieldCleared: () {
              _pagingController.refresh();
            },
            onFieldSubmitted: (val) {
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
                    final nextPageKey = _pageKey + 1;

                    _pagingController.appendPage(items, nextPageKey);
                  }
                } catch (e) {
                  /// Trigger paging controller error if error occurred
                  _pagingController.error = e;
                }
              }
            },
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  _searchController.clear();
                  _pagingController.refresh();
                },
                child: PagedListView<int, BookModel>.separated(
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
