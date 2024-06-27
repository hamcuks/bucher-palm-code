import 'package:bucher_palm_code/blocs/find_one/find_one_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../injector.dart';

class BookDetailScreen extends StatelessWidget {
  final int id;

  const BookDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<FindOneBookBloc, FindOneBookState>(
          bloc: sl<FindOneBookBloc>()..add(FindOneBookProccessed(id)),
          builder: (context, state) {
            /// Display error message if error occurred
            if (state.status.isError) {
              return const Center(
                child: Text("An error occurred!"),
              );
            }

            final data = state.item;
            final isDataNull = data == null;
            final isSuccess = state.status.isSuccess;

            return Skeletonizer(
              enabled: state.status.isInitial || state.status.isLoading,
              child: Stack(
                children: [
                  Container(
                    height: 156,
                    width: double.infinity,
                    color: Colors.blue.shade100,
                  ),
                  Positioned(
                    right: 32,
                    top: 132,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          (isSuccess && !isDataNull && data.isFavourite)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// Book cover
                        Container(
                            width: 128,
                            height: 172,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.blue.shade400, width: 2),
                              image: (isSuccess &&
                                      !isDataNull &&
                                      data.formats.image != null)
                                  ? DecorationImage(
                                      image: NetworkImage(data.formats.image!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: (isSuccess &&
                                    !isDataNull &&
                                    data.formats.image == null)
                                ? Icon(
                                    Icons.image,
                                    color: Colors.blue.shade900,
                                  )
                                : null),

                        const SizedBox(height: 24),

                        /// Book Title
                        Text(
                          data?.title ?? "Book Title",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),

                        /// Book Author
                        Text(
                          data?.authors.map((x) => x.name).join(", ") ??
                              "Book Author",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),

                        const SizedBox(height: 32),

                        /// Book Infos
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _bookInfo(
                              icon: Icons.copyright_outlined,
                              label: "Copyright",
                              value: isSuccess &&
                                      !isDataNull &&
                                      data.copyright != null &&
                                      data.copyright!
                                  ? "Yes"
                                  : "No",
                            ),
                            _bookInfo(
                              icon: Icons.translate,
                              label: "Languages",
                              value: data?.languages.join(", ").toUpperCase() ??
                                  "Languages",
                            ),
                            _bookInfo(
                              icon: Icons.download_rounded,
                              label: "Downloads",
                              value: data?.downloadCount.toString() ?? "Count",
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        /// Links to book
                        Column(
                          children: [
                            _readBookButton(
                              icon: Icons.text_fields_outlined,
                              label: "Read Book (Text)",
                            ),
                            const SizedBox(height: 8),
                            _readBookButton(
                              icon: Icons.web,
                              label: "Read Book (Web Pages)",
                            ),
                            const SizedBox(height: 8),
                            _readBookButton(
                              icon: Icons.menu_book_outlined,
                              label: "Read Book (Epub)",
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container _readBookButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue.shade900,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Column _bookInfo({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.black.withOpacity(0.5),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
