import 'package:developed_projects/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevelopedProjects());
}

class DevelopedProjects extends StatelessWidget {
  DevelopedProjects({Key? key}) : super(key: key);
  Color _primaryColor = HexColor('#0765e8');
  Color _accentColor = HexColor('#fab60a');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developed Projects',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const SplashScreen(title: 'Developed Projects'),
    );
  }
}
