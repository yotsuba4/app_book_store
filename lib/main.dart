import 'package:app_book_store/module/signin/signin_page.dart';
import 'package:app_book_store/module/signup/signup_page.dart';
import 'package:app_book_store/shared/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book store',
      theme: ThemeData(
        primarySwatch: AppColor.yellow,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SignInPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
