import '../../models/book_model.dart';
import '../book_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookModel? data;

  const BookCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    /// Create card with roundend and white background
    return GestureDetector(
      onTap: () {
        if (data != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailScreen(id: data!.id),
            ),
          );
        }
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade400),
              ),
              child: () {
                if (data == null) return null;

                if (data!.formats.image != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: data!.formats.image!,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) {
                        return Icon(
                          Icons.broken_image_outlined,
                          color: Colors.grey.shade400,
                        );
                      },
                    ),
                  );
                } else {
                  return Icon(
                    Icons.image,
                    color: Colors.grey.shade400,
                  );
                }
              }(),
            ),
            const SizedBox(width: 16),

            /// Display the book's title and author
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data?.title ?? "Book Title",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  _createBookInfo(
                    Icons.person_2_outlined,
                    () {
                      if (data?.authors == null) {
                        return "Author";
                      }

                      return data!.authors.map((x) => x.name).join(", ");
                    }(),
                  ),
                  const SizedBox(height: 4),
                  _createBookInfo(
                    Icons.translate,
                    () {
                      if (data?.languages == null) {
                        return "Languages";
                      }

                      return data!.languages.join(", ").toUpperCase();
                    }(),
                  ),
                  const SizedBox(height: 4),
                  _createBookInfo(
                    Icons.download_rounded,
                    "${data?.downloadCount ?? 0} Downloads",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createBookInfo(IconData icon, String data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            data,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
