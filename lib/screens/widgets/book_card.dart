import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    /// Create card with roundend and white background
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),

          /// Display the book's title and author
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Book Title",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _createBookInfo(Icons.person_2_outlined, "Author"),
              const SizedBox(height: 4),
              _createBookInfo(Icons.translate, "EN, FR"),
              const SizedBox(height: 4),
              _createBookInfo(Icons.download_rounded, "860 Downloads")
            ],
          ),
        ],
      ),
    );
  }

  Widget _createBookInfo(IconData icon, String data) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),
        Text(
          data,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}
