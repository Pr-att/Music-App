import 'package:flutter/material.dart';
import 'package:music_app/screens/home_page.dart';
import 'package:music_app/screens/search_screen.dart';
import 'package:music_app/utils/audio_player.dart';
import 'package:music_app/utils/bottom_navigation_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: ([
        ChangeNotifierProvider(create: (context) => AudioProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationIndex())
      ]),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/SearchScreen': (context) => const SearchScreen(),
      },
      initialRoute: '/HomePage',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
