// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomeController {
//   BuildContext? context; //variable
//   // ignore: body_might_complete_normally_nullable
//   Future? init(BuildContext contex) {
//     //metodo
//     // ignore: unnecessary_this
//     this.context = contex;
//   }

// //Metodo para pasar de pagina agregando gestoDetec y luego onTap

//   // void goToLoginPagePerfil() {
//   //   Navigator.pushAndRemoveUntil(
//   //       context!,
//   //       MaterialPageRoute(builder: (builder) => PagePerfil()),
//   //       (route) => false);
//   // }

//   Future<void> goToLinkedin() async {
//     await launch(
//         "https://www.linkedin.com/public-profile/settings?trk=d_flagship3_profile_self_view_public_profile",
//         forceWebView: true);
//   }

//   Future<void> goToGitHub() async {
//     await launch("https://github.com/elvisapp", forceWebView: true);
//   }

//   Future<void> goToWhatsapp() async {
//     await launch(
//         "https://api.whatsapp.com/send/?phone=5511914818483&text=Ola&type=phone_number&app_absent=0",
//         forceWebView: true);
//   }

//   Future<void> goToInstagram() async {
//     await launch("https://www.instagram.com/elvis.web/", forceWebView: true);
//   }

//   Future<void> goToFacebook() async {
//     await launch("https://www.facebook.com/elviscomwebapp/",
//         forceWebView: true);
//   }

//   Future<void> goToPagina() async {
//     await launch("https://elvis-com-original.web.app/", forceWebView: true);
//   }

//   Future<void> goToDonacion() async {
//     await launch("https://pag.ae/7W_Kistb2", forceWebView: true);
//   }

//   Future<void> goToConfiguracion() async {}

//   Future<void> goToDartUrl10() async {}
// }
