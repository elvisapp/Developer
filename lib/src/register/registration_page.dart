import 'package:developed_projects/src/register/controller_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../pages/widgets/header_widget.dart';
import '../services/googleAuthentication.dart';
import '../utilities/theme_helper.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegisterController _too = RegisterController();
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    _too.int(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              child: HeaderWidget(
                300,
                false,
                Icons.person_add_alt_1_rounded,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  //const SizedBox(height: 30.0),

                  _textTitulo(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  textItem("Name", _too.nomeController, false),
                  const SizedBox(height: 30.0),
                  textItem("Apellido", _too.apelidoController, false),
                  const SizedBox(height: 30.0),
                  textItem("Email", _too.emailController, false),
                  const SizedBox(height: 30.0),
                  textItem("Password", _too.passwordController, true),
                  const SizedBox(height: 30.0),
                  _buttonRegister(),
                  const SizedBox(height: 20.0),
                  //_redesSociales(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////////////////////// Metodos

  Widget _textTitulo() {
    return Text(
      'elvis.com',
      style: TextStyle(
          fontFamily: 'Roboto', fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
  //////////////

  Widget textItem(
      String name, TextEditingController controller, bool obsecureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: name,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////
  Widget _buttonRegister() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            'Registrar'.toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: () async {
          //if (_formKey.currentState!.validate()) {
          _too.controllerRegister(context, 'REGISTER');
          // }
        },
      ),
    );
  }

  Widget _redesSociales() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: FaIcon(
            FontAwesomeIcons.google,
            size: 35,
            color: HexColor("#EC2D2F"),
          ),
          onTap: () async {
            setState(() {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return ThemeHelper().alartDialog(
              //         "GitHub", "Usuario entrando con cuenta Gmail.", context);
              //   },
              // );
              _isSigningIn = true;
            });
            User? user =
                await Authentication.signInWithGoogle(context: context);

            setState(() {
              _isSigningIn = false;
            });

            if (user != null) {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => ProfilePage(
              //       user: user,
              //     ),
              //   ),
              // );
            }

            // _to.signInWithGoogle();
            // setState(() {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return ThemeHelper().alartDialog(
            //           "Google", "Usuario entrando con cuenta Gimail.", context);
            //     },
            //   );
            // });
          },
        ),
        SizedBox(
          width: 30.0,
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 5, color: HexColor("#0d0c0c")),
              color: HexColor("#0d0c0c"),
            ),
            child: FaIcon(
              FontAwesomeIcons.github,
              size: 23,
              color: HexColor("#FFFFFF"),
            ),
          ),
          onTap: () {
            setState(() {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper().alartDialog(
                      "GitHub", "Usuario entrando con GitHub.", context);
                },
              );
            });
          },
        ),
        SizedBox(
          width: 30.0,
        ),
        GestureDetector(
          child: FaIcon(
            FontAwesomeIcons.facebook,
            size: 35,
            color: HexColor("#3E529C"),
          ),
          onTap: () {
            setState(() {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper().alartDialog(
                      "Facebook", "Usuario entrando con Facebook.", context);
                },
              );
            });
          },
        ),
      ],
    );
  }
}

/////////////////////
///
///
///
///
///

// Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               child: FaIcon(
//                                 FontAwesomeIcons.google,
//                                 size: 35,
//                                 color: HexColor("#EC2D2F"),
//                               ),
//                               onTap: () {
//                                 _to.signInWithGoogle();
//                                 setState(() {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return ThemeHelper().alartDialog(
//                                           "Google",
//                                           "Usuario entrando con cuenta Gimail.",
//                                           context);
//                                     },
//                                   );
//                                 });
//                               },
//                             ),
//                             SizedBox(
//                               width: 30.0,
//                             ),
//                             GestureDetector(
//                               child: Container(
//                                 padding: EdgeInsets.all(0),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100),
//                                   border: Border.all(
//                                       width: 5, color: HexColor("#0d0c0c")),
//                                   color: HexColor("#0d0c0c"),
//                                 ),
//                                 child: FaIcon(
//                                   FontAwesomeIcons.github,
//                                   size: 23,
//                                   color: HexColor("#FFFFFF"),
//                                 ),
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return ThemeHelper().alartDialog(
//                                           "GitHub",
//                                           "Usuario entrando con GitHub.",
//                                           context);
//                                     },
//                                   );
//                                 });
//                               },
//                             ),
//                             SizedBox(
//                               width: 30.0,
//                             ),
//                             GestureDetector(
//                               child: FaIcon(
//                                 FontAwesomeIcons.facebook,
//                                 size: 35,
//                                 color: HexColor("#3E529C"),
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return ThemeHelper().alartDialog(
//                                           "Facebook",
//                                           "Usuario entrando con Facebook.",
//                                           context);
//                                     },
//                                   );
//                                 });
//                               },
//                             ),
//                           ],
//                         ),

// validator: (val) {
//                               if (val!.isEmpty) {
//                                 return "Please enter your password";
//                               }
//                               return null;
//                             },

// validator: (val) {
//                               if (!(val!.isEmpty) &&
//                                   !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
//                                       .hasMatch(val)) {
//                                 return "Enter a valid email address";
//                               }

// validator: (val) {
//                               if (!(val!.isEmpty) &&
//                                   !RegExp(r"^(\d+)*$").hasMatch(val)) {
//                                 return "Enter a valid phone number";
//                               }
//                               return null;
//                             },
