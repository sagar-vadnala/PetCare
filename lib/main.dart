import 'package:dog_assignment/Onboarding_Screens/onnoarding_screens.dart';
import 'package:dog_assignment/Splash_Screen/splash_screen.dart';
import 'package:dog_assignment/pages/cart_page.dart';
import 'package:dog_assignment/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
  ], child: const DogApp()));
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog App',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/history': (context) => HistoryPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
