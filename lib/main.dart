import 'package:bucher_palm_code/screens/book_list_screen.dart';
import 'package:bucher_palm_code/screens/my_books_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bucher - Palm Code',
      home: MainScreen(),
    );
  }
}

final ValueNotifier<int> tabBarMenuIndex = ValueNotifier(0);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tabBarMenuIndex,
      builder: (context, state, _) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (value) => tabBarMenuIndex.value = value,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories_outlined),
                activeIcon: Icon(
                  Icons.auto_stories,
                  color: Colors.blue,
                ),
                label: "Books",
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.redAccent.withOpacity(.7),
                ),
                label: "My Books",
              )
            ],
          ),
          body: (state == 0) ? const BookListScreen() : const MyBooksScreen(),
        );
      },
    );
  }
}
