// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:async';

// // el habla del problema nulo minuto 14:22 despues de las definicion de las clases

// class ControllerLogin {
//   BuildContext? context; //variable
//   bool _isSigningIn = false;
//   // ignore: body_might_complete_normally_nullable
//   Future? init(BuildContext contex) {
//     //metodo
//     // ignore: unnecessary_this
//     this.context = contex;
//   }

// //Metodos

//   RedesSociales (BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           child: FaIcon(
//             FontAwesomeIcons.google,
//             size: 35,
//             color: HexColor("#EC2D2F"),
//           ),
//           onTap: () async {
//             // setState(() {
//             //   // showDialog(
//             //   //   context: context,
//             //   //   builder: (BuildContext context) {
//             //   //     return ThemeHelper().alartDialog(
//             //   //         "GitHub", "Usuario entrando con cuenta Gmail.", context);
//             //   //   },
//             //   // );
//             //   _isSigningIn = true;
//             // });
//             _isSigningIn = true;
//             User? user =
//                 await Authentication.signInWithGoogle(context: context);

//             setState(() {
//               _isSigningIn = false;
//             });

//             if (user != null) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => ProfilePage(
//                     user: user,
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//         SizedBox(
//           width: 30.0,
//         ),
//         GestureDetector(
//           child: Container(
//             padding: EdgeInsets.all(0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               border: Border.all(width: 5, color: HexColor("#0d0c0c")),
//               color: HexColor("#0d0c0c"),
//             ),
//             child: FaIcon(
//               FontAwesomeIcons.github,
//               size: 23,
//               color: HexColor("#FFFFFF"),
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return ThemeHelper().alartDialog(
//                       "GitHub", "Usuario entrando con GitHub.", context);
//                 },
//               );
//             });
//           },
//         ),
//         SizedBox(
//           width: 30.0,
//         ),
//         GestureDetector(
//           child: FaIcon(
//             FontAwesomeIcons.facebook,
//             size: 35,
//             color: HexColor("#3E529C"),
//           ),
//           onTap: () {
//             setState(() {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return ThemeHelper().alartDialog(
//                       "Facebook", "Usuario entrando con Facebook.", context);
//                 },
//               );
//             });
//           },
//         ),
//       ],
//     );
//   }

//   // Future<void> goToDartUrl6() async {
//   //   await launch("https://elvis-com-original.web.app/", forceWebView: true);
//   // }

//   // void goToLoginPage10() {
//   //   Navigator.pushAndRemoveUntil(
//   //       context!,
//   //       MaterialPageRoute(builder: (builder) => PageJavascrip()),
//   //       (route) => false);
//   // }
// }
