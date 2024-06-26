import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
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
                  icon: const Icon(
                    Icons.favorite,
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
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// Book Title
                  const Text(
                    "Book Title",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Book Author
                  Text(
                    "Author",
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
                        value: "Yes",
                      ),
                      _bookInfo(
                        icon: Icons.translate,
                        label: "Languages",
                        value: "EN, FR, ID",
                      ),
                      _bookInfo(
                        icon: Icons.download_rounded,
                        label: "Downloads",
                        value: "8999",
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
        Icon(icon, size: 20),
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
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}