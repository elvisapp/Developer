import 'package:developed_projects/src/pages/projects/page_projects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class photoUpload extends StatefulWidget {
  const photoUpload({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  _photoUploadState createState() => _photoUploadState();
}

class _photoUploadState extends State<photoUpload> {
  File? _image; // imagen tomada de galeria
  String? url; // url de la imagem
  String? _myValue; //descripción
  final formKey = GlobalKey<FormState>();
  FirebaseStorage storage = FirebaseStorage.instance;
  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Upload Image",
          style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontFamily: 'Ole',
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        ////////////////////////////Texto o lo central
        child: _image == null
            ? const Text(
                "Select project image --->",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Ole',
                    fontWeight: FontWeight.w700),
              )
            : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        tooltip: "Add Image",
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

////////////////////////////////////Enviar imagen para storage
  void uploadStatusImage() async {
    if (validateAndSave()) {
      final Reference postImageRef = FirebaseStorage.instance.ref();
      var timeKey = DateTime.now();
      var dbTimeKey = DateTime.now();
      var formatDate = DateFormat('MMM d, yyyy');
      var formatTime = DateFormat('EEEE, hh:mm aaa');
      String date = formatDate.format(dbTimeKey);
      String time = formatTime.format(dbTimeKey);

      UploadTask uploadTask =
          postImageRef.child(timeKey.toString() + ".jpg").putFile(
              _image!,
              SettableMetadata(customMetadata: {
                'uploaded_by': 'Contributing Developer', //////titulo
                'description': _myValue!,
                "date": date,
                "time": time,
              }));

      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();
      print(url);
      // Guardar el post en la bbdd

      //Regresar en Home
      //Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectsPage(user: _user)),
      );
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  //////////////mostrar imagen
  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        height: 400.0,
                        width: 600.0,
                      )
                    : const Text('Please select an image'),
                SizedBox(
                  height: 15.0,
                ),
                _linkTexfield(),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  elevation: 10.0,
                  child: Text("Add project"),
                  textColor: Colors.white,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.deepOrange),
                  ),
                  onPressed: uploadStatusImage,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///////////////////pegar foto
  Future<void> getImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

///////////////////////////////////////////////////////////////////Link
  Widget _linkTexfield() {
    return TextFormField(
      style: const TextStyle(
        /////color de la letra
        color: Color.fromARGB(255, 201, 9, 9),
        decorationColor: Color(0XFFFFCC00), //Font color change
        backgroundColor: Color(0XFFFFCC00),
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.green),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: "https://github.com/",
          labelText: "Link GitHub"),
      validator: (value) {
        return value!.isEmpty ? "es obligatorio" : null;
      },
      onSaved: (value) {
        _myValue = value;
      },
    );
  }
}
