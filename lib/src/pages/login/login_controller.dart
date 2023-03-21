import 'package:developed_projects/src/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  bool _isSigningIn = false;
  BuildContext? context;
  Future? int(BuildContext context) {
    this.context = context;
  }

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool circular = false;

  ///Metodos de esta classe]

  void controllerLogin(BuildContext context) async {
    try {
      firebase_auth.UserCredential userCredential =
          await firebase_auth.FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      final snackbar = (SnackBar(
        content: Text("welcome, login successful"),
        backgroundColor: Color.fromARGB(255, 71, 2, 2),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      print('Logado con exito');
      print(userCredential.user?.email);
      circular = false;
      _isSigningIn = true;

      // // User? user = await Authentication.signInWithGoogle(context: context);
      User? user = FirebaseAuth.instance.currentUser;

      _isSigningIn = false;
      // setState(() {
      //         _isSigningIn = true;
      //       });

      // setState(() {
      //   _isSigningIn = false;
      // });

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(
              user: user,
            ),
          ),
        );
      }

      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => HomePage(user: user ,),
      //   ),
      // );

      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (builder) => HomePage()),
      //     (route) => false);
    } catch (e) {
      print("Error: ${e.toString()}");
      final snackbar = (SnackBar(
        content: Text("Falha ao realizar ologin"),
        backgroundColor: Color.fromARGB(255, 61, 2, 2),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  // Widget textItem(
  //     String name, TextEditingController controller, bool obsecureText) {
  //   return Container(
  //     width: MediaQuery.of(context!).size.width - 70,
  //     height: 55,
  //     child: TextFormField(
  //       controller: controller,
  //       obscureText: obsecureText,
  //       style: const TextStyle(
  //         fontSize: 17,
  //         color: Colors.white,
  //       ),
  //       decoration: InputDecoration(
  //         labelText: name,
  //         labelStyle: const TextStyle(
  //           fontSize: 17,
  //           color: Colors.white,
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: const BorderSide(
  //             width: 1.5,
  //             color: Colors.amber,
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: const BorderSide(
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void goToLoginPagePerfil() {
  //   Navigator.pushAndRemoveUntil(
  //       context!,
  //       MaterialPageRoute(builder: (builder) => PagePerfil()),
  //       (route) => false);
  // }

  // Future<void> goToLinkedin() async {
  //   await launch(
  //       "https://www.linkedin.com/public-profile/settings?trk=d_flagship3_profile_self_view_public_profile",
  //       forceWebView: true);
  // }

}
