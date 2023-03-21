import 'package:developed_projects/src/pages/home/home_page.dart';
import 'package:developed_projects/src/pages/projects/uploadProjects.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilities/colors.dart';
import '../home/home_controller.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  FirebaseStorage storage = FirebaseStorage.instance;
  HomeController _to = HomeController();
  String _selectedValue = 'Nothing selected';
  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _to.init(context);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //title: Center(child: const Text('elvis.com')),
        leading: IconButton(
          color: HexColor("#F3C54D"),
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (builder) => HomePage(
                          user: _user,
                        )),
                (route) => false);
          },
        ),

        // Coloca el icono detrás
        actions: <Widget>[
          _user.photoURL != null
              ? ClipOval(
                  child: Image.network(
                    _user.photoURL!,
                    fit: BoxFit.fitHeight,
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
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: IconButton(
              color: HexColor("#F3C54D"),
              icon: Icon(Icons.file_upload),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => photoUpload(user: _user)),
                );
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            color: HexColor("#F3C54D"),
            icon: Icon(Icons.logout),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Elvis.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Ole',
                  fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];
///////////////////////////////////////////////////////////////////////imagenes
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => launch("https://github.com/elvisapp",
                                  forceWebView: true),
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 30.0,
                                  left: 20.0,
                                ),
                                height: 500.0,

                                /// ==>original 220.0 e 330 de ancho
                                width: 230.0,
                                decoration: BoxDecoration(
                                    color: Colors.red, //PARA PROBAR CONTAINER
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        image['url'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      new BoxShadow(
                                        //SOMBRA
                                        color: Color(0xffA4A4A4),
                                        offset: Offset(1.0, 5.0),
                                        blurRadius: 3.0,
                                      ),
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      color: Colors.amber,
                                      child: Text(image['uploaded_by']),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              image['description'],
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  image['date'],
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  image['time'],
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            _menuButom(),
                            const Divider(
                              color: Colors.black,
                              //color: Theme.of(context).primaryColor,
                              height: 2.5,
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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

  Widget _menuButom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'elvis.com',
          style: TextStyle(color: Colors.red),
        ),
        IconButton(
          color: Colors.red,
          icon: Icon(Icons.downloading),
          onPressed: () {
            launch("https://github.com/elvisapp", forceWebView: true);
          },
        ),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final Reference postImageRef = FirebaseStorage.instance.ref();
    ListResult result = await postImageRef.listAll();
    List<Reference> allFiles = result.items;
    allFiles.sort((a, b) => b.name.compareTo(a.name));

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      final data = files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Home Free',
        "description": fileMeta.customMetadata?['description'] ?? '',
        "date": fileMeta.customMetadata?['date'] ?? 'Mar, 2023',
        "time": fileMeta.customMetadata?['time'] ?? '00:00 AM ',
        "timeCreated": fileMeta.timeCreated,
      });
    });

    return files;
  }
}
