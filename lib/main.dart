import 'package:flutter/material.dart';
import 'package:nasa2/screens/apod_screen.dart';
import 'package:nasa2/screens/screen.dart';
//import 'package:nasa2/widgets/apod_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:nasa2/providers/nasa_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NasaProvider(),
      child: MaterialApp(
        title: 'NASA',
        initialRoute: 'apod',
        routes: {
          'home': (_) => const HomeScreen(),
          'apod': (_) => const ApodScreen(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
