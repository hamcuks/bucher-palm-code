import 'blocs/add_my_books/add_my_books_bloc.dart';
import 'blocs/find_one/find_one_book_bloc.dart';
import 'blocs/get_book/get_book_bloc.dart';
import 'injector.dart';
import 'models/book_model.dart';
import 'screens/book_list_screen.dart';
import 'screens/my_books_screen.dart';
import 'services/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependency();

  /// Open ISAR Database and register schema
  var dir = await getApplicationDocumentsDirectory();
  sl<DatabaseManager>().open(schemas: [BookModelSchema], directory: dir.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Register the blocs
        BlocProvider(create: (context) => sl<GetBookBloc>()),
        BlocProvider(create: (context) => sl<AddMyBooksBloc>()),
        BlocProvider(create: (context) => sl<FindOneBookBloc>()),
      ],
      child: MaterialApp(
        title: 'Bucher - Palm Code',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue.shade50,
        ),
        home: const MainScreen(),
      ),
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
                icon: const Icon(Icons.favorite_border),
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
