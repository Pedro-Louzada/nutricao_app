import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nutricao_app/pages/cadastro_page.dart';
import 'package:nutricao_app/pages/login_page.dart';
import 'firebase_options.dart';
import 'package:nutricao_app/view/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Healthly App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return const LoginPage();
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}
