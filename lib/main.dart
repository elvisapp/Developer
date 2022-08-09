import 'package:developed_projects/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevelopedProjects());
}

class DevelopedProjects extends StatelessWidget {
  DevelopedProjects({Key? key}) : super(key: key);
  Color _primaryColor = HexColor('#0765e8');
  Color _accentColor = HexColor('#fab60a');

  //Widget currentPage = SignUpPage();
  //AuthClass authClass = AuthClass();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Developed Projects',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.blue,
        //primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(title: 'Developed Projects'),
    );
  }
}
