import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primaryColor: Colors.green[900],
      appBarTheme: AppBarTheme(
        color: Colors.green[900],
      ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.green[900],
            secondary: Colors.green[900],
          ),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            buttonColor: Colors.green[900],
            textTheme: ButtonTextTheme.primary,
          ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     padding: const EdgeInsets.all(40.0),
      //     primary: Colors.white,
      //     backgroundColor: Colors.green[900],
      //   ),
      // ),
      iconTheme: Theme.of(context).iconTheme.copyWith(
            color: Colors.white,
          ),
      textTheme: Theme.of(context).textTheme.copyWith(
            bodyText2: Theme.of(context).textTheme.bodyText2?.apply(
                  color: Colors.white,
                ),
          ),
    );

    return MaterialApp(
      theme: theme,
      home: const Dashboard(),
    );
  }
}
