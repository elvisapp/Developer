import 'package:developed_projects/src/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:developed_projects/src/pages/profile_page.dart';
//import 'package:developed_projects/src/pages/utils/authentication.dart';

class RegisterController {
  bool _isSigningIn = false;
  BuildContext? context;
  Future? int(BuildContext context) {
    this.context = context;
  }

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController apelidoController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool circular = false;

  ///Metodos de esta classe]

  void controllerRegister(BuildContext context, String name) async {
    validator:
    (val) {
      if (!(val!.isEmpty) &&
          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(val)) {
        return "Enter a valid email address";
      }
      return null;
    };
    try {
      firebase_auth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      ////////////////////
      final snackbar = (SnackBar(
        content: Text("welcome, Register successful"),
        backgroundColor: Color.fromARGB(255, 71, 2, 2),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      print('Registro exitos');
      print(userCredential.user?.email);
      circular = false;
      _isSigningIn = true;
      User? user = FirebaseAuth.instance.currentUser;

      _isSigningIn = false;

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(
              user: user,
            ),
          ),
        );
      }
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (builder) => HomePage()),
      //     (route) => false);
    } catch (e) {
      print("Error: ${e.toString()}");
      print('No se pudo registrar');
      final snackbar = (SnackBar(
        content: Text("Falha ao realizar Register"),
        backgroundColor: Color.fromARGB(255, 61, 2, 2),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      circular = false;
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
