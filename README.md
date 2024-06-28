### Palm Code - Technical Test

#### SDK Version
This app build with the Flutter SDK version: 3.22.2 and Dart SDK version: 3.4.3

#### How to Run
Follow the steps below to run the app project:
1. Clone the app project using this repo url
2. Open terminal or command prompt, and change current directory to app project folder
3. Then run this command `flutter pub get` to get all required packages
4. Run this command `flutter pub run build_runner build --delete-conflicting-outputs` to generate the ISAR schemas
5. To run the app, type `flutter run` or press F5 if you are using VSCode

#### Lib Folder Structures
1. **blocs**, collection of the business logic such as get user data or create user data
2. **models**, contains the model that represents JSON data
3. **screens**, contains all app screens such as HomeScreen and CreateUserScreen
4. **screens/widgets**, collections of all UI widgets such as UserCardWidget
5. **repositories**, contains set of functions to get data from local or remote data sources
6. **datasources**, contains two folders: local and remote. The local folder used to hold database queries and the remote folder used to hold the API calls functions
7. **services**, contains services that used inside the app. For example: DatabaseManager, NetworkClient, NotificationHandler, etc

This app use the MVVM design pattern, it's suite to use because this app does not contains complex features

#### Libraries/Packages

1. **flutter_bloc** used to manage the app state
2. **get_it** to provides the dependency injection feature
3.  **dio** to provides the HTTP client request
4. **skeletonizer** to provides UI loading shimmer animation 
5. **isar** to provides store data locally
6. **internet_connection_checker_plus** to check current device's network connection
7. **cached_network_image** used to cache the image data
8. **infinite_scroll_pagination** to provides pagination functionality
9. **url_launcher** to provides URL launcher support
