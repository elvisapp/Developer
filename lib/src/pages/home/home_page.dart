import 'package:developed_projects/src/pages/home/home_controller.dart';
import 'package:developed_projects/src/utilities/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseStorage storage = FirebaseStorage.instance;
  HomeController _to = HomeController();
  //final RedesController _to = RedesController();
  late User _user;
  bool _isSigningOut = false;
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

//////////
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  ///////////////////////////////store

  final List<Widget> items = [
    Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    GestureDetector(
      onTap: (() {}),
      child: Container(
        color: Colors.amber,
        child: Image.network('https://i.imgur.com/5JEmpD7.gif'),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    Container(
      color: Color.fromARGB(255, 15, 15, 13),
      child: RaisedButton(
        child: Icon(Icons.browser_updated),
        color: Colors.red,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    Image.network('https://i.imgur.com/ZP7OEsF.gif'),
    Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    Container(
      color: Color.fromARGB(255, 15, 15, 13),
      child: RaisedButton(
        child: Icon(Icons.browser_updated),
        color: Colors.red,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    Container(
      color: Colors.red,
      child: Image.network('https://i.imgur.com/Irm7Ggx.gif'),
    ),
    Container(
      color: Color.fromARGB(255, 15, 15, 13),
      child: RaisedButton(
        child: Icon(Icons.browser_updated),
        color: Colors.red,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    Container(
      color: Colors.amber,
      child: RaisedButton(
        child: Text(
          'PROJECTS',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  ];

  ////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    _to.init(context);
    ///////////////////////////////////
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 20, 4, 252),
            Color.fromARGB(255, 244, 244, 247),
            Colors.black,
          ])),
          child: ListView(
            //shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                //margin: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 20, 4, 252),
                  Colors.black,
                  Color.fromARGB(255, 244, 244, 247),
                ])),
                child: Column(
                  children: [
                    Row(),
                    _user.photoURL != null
                        ? ClipOval(
                            child: Material(
                              color: CustomColors.firebaseGrey.withOpacity(0.3),
                              child: Image.network(
                                _user.photoURL!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: Material(
                              color: CustomColors.firebaseGrey.withOpacity(0.3),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: CustomColors.firebaseGrey,
                                ),
                              ),
                            ),
                          ),
                    //SizedBox(height: 16.0),
                    //////////////Saluudo del sistema
                    Text(
                      _user.displayName!,
                      style: TextStyle(
                        color: CustomColors.firebaseYellow,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.11,
              // ),

              ListTile(
                title: Center(
                  child: Text(
                    ' ${_user.email!}',
                    style: TextStyle(
                      color: CustomColors.firebaseNavy,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              //////////////////////////////////////////////////////////////link

              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToLinkedin(),
                child: const ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Linkedin'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToGitHub(),
                child: const ListTile(
                  leading: Icon(Icons.install_desktop),
                  title: Text('GitHub'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToWhatsapp(),
                child: const ListTile(
                  leading: Icon(Icons.whatsapp),
                  title: Text('Whatsapp'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToInstagram(),
                child: const ListTile(
                  leading: Icon(Icons.insert_link_sharp),
                  title: Text('Intagram'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToFacebook(),
                child: const ListTile(
                  leading: Icon(Icons.facebook),
                  title: Text('Facebook'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToPagina(),
                child: const ListTile(
                  leading: Icon(Icons.language),
                  title: Text('elvis.com'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToDonacion(),
                child: const ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('Donación'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => SystemNavigator.pop(),
                child: const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Exit'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              GestureDetector(
                onTap: () => _to.goToConfiguracion(),
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
            ],
          ),
        ),
      ),
      ////////////////////////////////////////////////////////////aqui esta el body
      body: CustomScrollView(
        slivers: [
          _appBarPrincipal(context),
          SliverList(delegate: SliverChildListDelegate(items)),
          SliverFillRemaining(
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.brown,
                Color.fromARGB(255, 244, 244, 247),
                Colors.brown,
              ])),
              child: InteractiveViewer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _lineaRecta(),
                      const SizedBox(
                        height: 10,
                      ),

                      //_appBarra(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                            child: _listProjects(
                                context, 'https://i.imgur.com/oS3oWGa.png'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                            child: _listProjects(
                                context, 'https://i.imgur.com/UEdMELp.jpg'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),

//////////////////////////////////////////////////////////////////////////////////////////////////
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                            child: _listProjects(
                                context, 'https://i.imgur.com/cdMYJ8X.jpg'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                            child: _listProjects(
                                context, 'https://i.imgur.com/nYdGEvq.jpg'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),

//////////////////////////////////////////////////////////////////////////////////////////////////
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                            child: _listProjects(
                                context, 'https://i.imgur.com/CRPFi1w.jpg'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                            child: _listProjects(
                                context, 'https://i.imgur.com/CvIviAA.jpg'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),

//////////////////////////////////////////////////////////////////////////////////////////////////
                        ],
                      ),

                      //_teste(context),

                      // SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _to.whatsAppOpen();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.whatsapp_rounded),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////Widget
  Widget _appBarPrincipal(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.amber),
      floating: true,
      pinned: true,

      title: Center(
          child: Text(
        'Developed Projects',
        style: TextStyle(color: Colors.amber),
      )),
      //leadingWidth: 200,
      expandedHeight: 210,
      flexibleSpace:
          // Image.asset(
          //   'assets/images/logo_banner.png',
          // ),
          Image.network(
        'https://i.imgur.com/oDntKPb.gif',
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _boton(String texto) {
    return RaisedButton(
      child: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.red,
      elevation: 20,
      padding: EdgeInsets.all(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.deepOrange),
      ),
      onPressed: () => {
        // use pageroute para lanzar a otra ventana
        print("BOTON: " + texto)
      },
    );
  }

  ///////
  Widget _listProjects(BuildContext context, String image) {
    return Column(
      children: [
        Image.network(image, width: 150.0),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'FLUTTER PROJECTS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),

        //Container(title)
      ],
    );
  }

  /////////////////////////////
  Widget _lineaRecta() {
    return Container(
      width: 1500,
      color: Colors.amber,
      height: 10,
    );
  }
}
