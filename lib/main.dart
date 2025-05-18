import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import your login screen from the screens folder
import 'screens/signup_screen.dart'; // You can import other screens here too

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutriscan', // Set the app title
      theme: ThemeData(
        // You can customize your app's theme here
        primarySwatch: Colors.green, // Example primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Define input decoration theme globally if you want consistent text field styles
         inputDecorationTheme: InputDecorationTheme(
             filled: true,
             fillColor: Colors.grey[200],
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(8.0),
               borderSide: BorderSide.none,
             ),
             contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
         ),
      ),
      home: const LoginScreen(), // Set LoginScreen as the initial screen when the app starts
      debugShowCheckedModeBanner: false, // Hide the debug banner in the corner
    );
  }
}