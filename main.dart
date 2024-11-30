import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider package harus diimport
import 'screens/home_screen.dart'; // Pastikan path ini benar
import 'themes/app_theme.dart'; // Pastikan path ini benar
import 'themes/theme_provider.dart'; // Pastikan path ini benar

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Instance ThemeProvider untuk state management
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengakses ThemeProvider untuk mengatur themeMode
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lazada UI',
      theme: AppTheme.lightTheme, // Tema terang
      darkTheme: AppTheme.darkTheme, // Tema gelap
      themeMode: themeProvider.themeMode, // Mode tema (light/dark)
      home: HomeScreen(), // Layar utama
    );
  }
}
