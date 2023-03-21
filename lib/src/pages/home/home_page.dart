import 'package:developed_projects/src/pages/home/home_controller.dart';
import 'package:developed_projects/src/pages/projects/page_projects.dart';
import 'package:developed_projects/src/utilities/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Colors.amber,
            Colors.blue,
            Colors.red,
          ])),
          child: ListView(
            //shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: const EdgeInsets.symmetric(vertical: 19.0),
                //margin: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.amber,
                  Colors.blue,
                  Colors.red,
                ])),
                child: Column(
                  children: [
                    Row(),
                    //SizedBox(height: 5.0),
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
                    //SizedBox(height: 20.0),
                    //////////////Saluudo del sistema
                    _user.displayName != null
                        ? Text(_user.displayName!,
                            style: TextStyle(
                              color: CustomColors.firebaseYellow,
                              fontSize: 20,
                            ))
                        : Text("Actualice su e-mail"),
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
      iconTheme: IconThemeData(color: HexColor("#F3C54D")),
      floating: true,
      pinned: true,
      actions: [
        IconButton(
          color: HexColor("#F3C54D"),
          icon: Icon(Icons.downloading),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (builder) => ProjectsPage(
                          user: _user,
                        )),
                (route) => false);
          },
        ),
      ],

      title: Center(
          child: Text(
        'Developed Projects',
        style: TextStyle(color: HexColor("#F3C54D")),
      )),
      //leadingWidth: 200,
      expandedHeight: 210,
      flexibleSpace:
          // Image.asset(
          //   'assets/images/logo_banner.png',
          // ),
          Image.network(
        'https://i.imgur.com/sD6jKgI.gif',
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

/////////////////////////////////////////////////////////////////////Lista de item
  final List<Widget> items = [
    Container(
      width: 1500,
      color: Colors.blue,
      height: 10,
    ),
    GestureDetector(
      onTap: (() {
        launch("https://github.com/elvisapp/Perfil", forceWebView: true);
      }),
      child: Container(
        color: Colors.amber,
        child: Image.network('https://i.imgur.com/5JEmpD7.gif'),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.blue,
      height: 10,
    ),
    Container(
      color: Color.fromARGB(255, 15, 15, 13),
      child: RaisedButton(
        child: Icon(Icons.browser_updated),
        color: Colors.green,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {
          launch("https://github.com/elvisapp/Perfil", forceWebView: true);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.red,
      height: 10,
    ),
    Container(
        color: Colors.blue,
        child: Image.network('https://i.imgur.com/ZP7OEsF.gif')),
    Container(
      width: 1500,
      color: Colors.red,
      height: 10,
    ),
    Container(
      color: Color.fromARGB(255, 15, 15, 13),
      child: RaisedButton(
        child: Icon(Icons.browser_updated),
        color: Colors.green,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {
          launch("https://github.com/elvisapp/Perfil", forceWebView: true);
        },
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
      width: 1500,
      color: Colors.amber,
      height: 10,
    ),
    Container(
      color: Color.fromARGB(255, 15, 15, 13),
      child: RaisedButton(
        child: Icon(Icons.browser_updated),
        color: Colors.green,
        elevation: 20,
        padding: EdgeInsets.all(10),
        onPressed: () {
          launch("https://github.com/elvisapp/Perfil", forceWebView: true);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    ),
    Container(
      width: 1500,
      color: Colors.amber,
      height: 30,
    ),
  ];
}
