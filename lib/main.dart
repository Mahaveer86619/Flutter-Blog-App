import 'package:flutter/material.dart';
import 'package:supabase_blog/core/theme/theme.dart';
import 'package:supabase_blog/features/presentation/page/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkModeTheme,
      darkTheme: AppTheme.darkModeTheme,
      home: const SignInPage(),
    );
  }
}
