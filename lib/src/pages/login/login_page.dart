import 'package:developed_projects/src/pages/home/home_page.dart';
import 'package:developed_projects/src/pages/login/login_controller.dart';
import 'package:developed_projects/src/services/googleAuthentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../register/registration_page.dart';
import '../../utilities/colors.dart';
import '../../utilities/theme_helper.dart';
import '../widgets/buttomGoogle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _to = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.yellow,
                Colors.blue,
                Colors.red,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bannerApp(),
              const SizedBox(
                height: 15.0,
              ),
              _textTitulo(),
              const SizedBox(
                height: 15.0,
              ),

              textItem("Email", _to.emailController, false),
              const SizedBox(height: 30.0),
              textItem("Password", _to.passwordController, true),
              const SizedBox(height: 15.0),
              _textOlvidasteContrasena(),
              _buttonLogin(),
              _textNotienecuenta(),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              const SizedBox(height: 15.0),
              inicializarBoton(),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 5,
              ),
              const SizedBox(height: 15.0),
              _pie(),

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

  Widget _textDescripcion() {
    return Text(
      'Inicia sesión en tu cuenta',
      style: TextStyle(color: Colors.grey),
    );
  }

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
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: name,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
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

  Widget _textOlvidasteContrasena() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Olvidaste tu contraseña?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////Metodo ButtonLogin
  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            'Entrar'.toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: () async {
          _to.controllerLogin(context);
          // }
        },
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////
  Widget _textNotienecuenta() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "No tienes cuenta? "),
        TextSpan(
          text: 'Crear',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
      ])),
    );
  }

///////////////////////////////////////////////////////////////////////////Boton Google
  Widget inicializarBoton() {
    return FutureBuilder(
      future: Authentication.initializeFirebase(context: context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return GoogleSignInButton();
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            CustomColors.firebaseOrange,
          ),
        );
      },
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
