import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../blocs/get_book/get_book_bloc.dart';
import '../../injector.dart';
import '../../models/book_model.dart';
import '../../services/database_manager.dart';
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
  late final StreamSubscription<InternetStatus> _internetListener;

  final ValueNotifier<bool> _hasInternet = ValueNotifier(true);

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

    _watchBooksCollection();

    _checkInternetConnection();

    super.initState();
  }

  void _watchBooksCollection() async {
    final isar = await sl<DatabaseManager>().isar;

    /// Watch Books collection
    final listener = isar.Books.watchLazy(fireImmediately: true);

    /// Refresh paging controller when book collection changed
    _isarListener = listener.listen((_) {
      /// Only refresh the pagingController if the page is My Books
      /// because we want to know the updated items after isFavourite state changes
      if (widget.isFavorite) _pagingController.refresh();
    });
  }

  void _checkInternetConnection() async {
    /// Check the initial connection state and listen the state change
    _hasInternet.value = await sl<InternetConnection>().hasInternetAccess;

    _internetListener = sl<InternetConnection>().onStatusChange.listen((state) {
      _hasInternet.value = state == InternetStatus.connected;
    });
  }

  @override
  void dispose() {
    _isarListener.cancel();
    _internetListener.cancel();
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
        ValueListenableBuilder(
          valueListenable: _hasInternet,
          builder: (context, state, _) {
            if (state) return const SizedBox();

            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "You don't have internet access. The data might not updated!",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          },
        ),
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
