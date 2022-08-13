import 'package:developed_projects/src/pages/home/home_page.dart';
import 'package:developed_projects/src/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget currentPage = LoginPage();
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    //_con.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.black,
                Colors.black,
                Colors.black,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bannerApp(),
              const SizedBox(
                height: 15.0,
              ),
              _textTitulo(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              _logoInicial(),
              const SizedBox(height: 45.0),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              _cuentaRedesSociales(),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 5,
              ),
              const SizedBox(height: 15.0),

              _pie(),
              //_registroTiempoReal(),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            ],
          ),
        )),
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////Banner
  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Colors.amber,
              Colors.blue,
              Colors.red,
            ]),
          ),
          height: MediaQuery.of(context).size.height * 0.25,
          //height: _headerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/icon/logo_app.png',
                width: 150,
                height: 100,
              ),
            ],
          ) //let's create a common header widget
          ),
    );
  }
  /////////////////////////////////////////////////////////////////////////Titulo

  Widget _textTitulo() {
    return const Text(
      "LOGIN",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////LogoInicial
  Widget _logoInicial() {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/logo_inicial.png'),
      radius: 100,
    );
  }

/////////////////////////////////////////////////////////////////////////CuentaRedesSociales
  Widget _cuentaRedesSociales() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: FaIcon(
            FontAwesomeIcons.google,
            size: 45,
            color: HexColor("#EC2D2F"),
          ),
          onTap: () async {
            setState(() {
              _isSigningIn = true;
            });
            User? user =
                await Authentication.signInWithGoogle(context: context);

            setState(() {
              _isSigningIn = false;
            });

            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    user: user,
                  ),
                ),
              );
            }
          },
        ),
        // SizedBox(
        //   width: 30.0,
        // ),
        // GestureDetector(
        //   child: Container(
        //     padding: EdgeInsets.all(0),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(100),
        //       border: Border.all(width: 5, color: HexColor("#0d0c0c")),
        //       color: HexColor("#0d0c0c"),
        //     ),
        //     child: FaIcon(
        //       FontAwesomeIcons.github,
        //       size: 23,
        //       color: HexColor("#FFFFFF"),
        //     ),
        //   ),
        //   onTap: () {
        //     // setState(() {
        //     //   showDialog(
        //     //     context: context,
        //     //     builder: (BuildContext context) {
        //     //       return ThemeHelper().alartDialog(
        //     //           "GitHub", "Usuario entrando con GitHub.", context);
        //     //     },
        //     //   );
        //     // });
        //   },
        // ),
        // SizedBox(
        //   width: 30.0,
        // ),
        // GestureDetector(
        //   child: FaIcon(
        //     FontAwesomeIcons.facebook,
        //     size: 35,
        //     color: HexColor("#3E529C"),
        //   ),
        //   onTap: () {
        //     // setState(() {
        //     //   showDialog(
        //     //     context: context,
        //     //     builder: (BuildContext context) {
        //     //       return ThemeHelper().alartDialog(
        //     //           "Facebook", "Usuario entrando con Facebook.", context);
        //     //     },
        //     //   );
        //     // });
        //   },
        // ),
      ],
    );
  }
  /////////////////////////////////////////////////////////////////////////Pie

  Widget _pie() {
    return ClipPath(
      clipper: WaveClipperTwo(flip: false, reverse: true),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Colors.amber,
            Colors.blue,
            Colors.red,
          ]),
        ),
        height: MediaQuery.of(context).size.height * 0.19,
        //height: _headerHeight,
        //let's create a common header widget
      ),
    );
  }
}
