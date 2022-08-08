// import 'dart:math';
// import 'package:developed_projects/src/utilities/colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key, required User user})
//       : _user = user,
//         super(key: key);
//   final User _user;

//   @override
//   State<StatefulWidget> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //final RedesController _to = RedesController();
//   late User _user;
//   bool _isSigningOut = false;
//   double _drawerIconSize = 24;
//   double _drawerFontSize = 17;

// //////////
//   @override
//   void initState() {
//     _user = widget._user;

//     super.initState();
//   }

//   ////////////
//   final rnd = new Random();
//   final List<Image> images = [
//     Image.network(
//         'https://static.wikia.nocookie.net/logo-timeline/images/c/cf/4B4A9751-D2BF-4A93-BDCC-CDCA5326B65F.png/revision/latest?cb=20210426191500'),

//     Image.network(
//         'https://smd-prod.s3.amazonaws.com/ciencia-pink/s3fs-public/styles/background_image_file_size/public/thumbnails/image/simulated_bh.jpg?itok=W_K6NJmW'),
//     Image.network(
//         'https://static.wikia.nocookie.net/logo-timeline/images/c/cf/4B4A9751-D2BF-4A93-BDCC-CDCA5326B65F.png/revision/latest?cb=20210426191500'),
//     Image.network(
//         'https://smd-prod.s3.amazonaws.com/ciencia-pink/s3fs-public/styles/background_image_file_size/public/thumbnails/image/simulated_bh.jpg?itok=W_K6NJmW'),
//     Image.network(
//         'https://smd-prod.s3.amazonaws.com/ciencia-pink/s3fs-public/styles/background_image_file_size/public/thumbnails/image/simulated_bh.jpg?itok=W_K6NJmW'),
//     Image.network(
//         'https://smd-prod.s3.amazonaws.com/ciencia-pink/s3fs-public/styles/background_image_file_size/public/thumbnails/image/simulated_bh.jpg?itok=W_K6NJmW'),

//     // Colors.yellow,
//     // Colors.blue,
//     // Colors.red,
//     // Colors.purple,
//     // Colors.amber,
//     // Colors.yellow,
//     // Colors.blue,
//     // Colors.red,
//     // Colors.blue,
//     // Colors.black,
//     // Colors.yellow,
//     // Colors.amber,
//     // Colors.black,
//   ];

//   ///
//   ///

//   @override
//   Widget build(BuildContext context) {
//     //_to.init(context);
//     final List<Widget> items = List.generate(
//         100,
//         (i) => Container(
//               width: double.infinity,
//               height: 150,
//               //: images    [rnd.nextInt(this.images.length)],
//             )

//         // Container(
//         //       width: double.infinity,
//         //       height: 150,
//         //       color: colores[rnd.nextInt(this.colores.length)],
//         //     )

//         );

//     ///////////////////////////////////
//     return Scaffold(
//       drawer: Drawer(
//         child: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//             Color.fromARGB(255, 20, 4, 252),
//             Color.fromARGB(255, 244, 244, 247),
//             Colors.black,
//           ])),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 //margin: const EdgeInsets.all(8.0),
//                 decoration: const BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                   Color.fromARGB(255, 20, 4, 252),
//                   Colors.black,
//                   Color.fromARGB(255, 244, 244, 247),
//                 ])),
//                 child: Column(
//                   children: [
//                     // ListTile(
//                     //   leading: Icon(Icons.account_circle),
//                     //   // onTap: () => _con.goToLoginPagePerfil(),
//                     // ),
//                     Row(),
//                     _user.photoURL != null
//                         ? ClipOval(
//                             child: Material(
//                               color: CustomColors.firebaseGrey.withOpacity(0.3),
//                               child: Image.network(
//                                 _user.photoURL!,
//                                 fit: BoxFit.fitHeight,
//                               ),
//                             ),
//                           )
//                         : ClipOval(
//                             child: Material(
//                               color: CustomColors.firebaseGrey.withOpacity(0.3),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 60,
//                                   color: CustomColors.firebaseGrey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                     //SizedBox(height: 16.0),
//                     //////////////Saluudo del sistema
//                     Text(
//                       _user.displayName!,
//                       style: TextStyle(
//                         color: CustomColors.firebaseYellow,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // SizedBox(
//               //   height: MediaQuery.of(context).size.height * 0.11,
//               // ),

//               ListTile(
//                 title: Center(
//                   child: Text(
//                     ' ${_user.email!}',
//                     style: TextStyle(
//                       color: CustomColors.firebaseNavy,
//                       fontSize: 15,
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 ),
//               ),

//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               //////////////////////////////////////////////////////////////link
//               // const ListTile(
//               //   leading: Icon(Icons.account_circle),
//               //   title: Text('Perfil'),
//               //   // onTap: () => _con.goToLoginPagePerfil(),
//               // ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.label),
//                 title: Text('Linkedin'),
//                 // onTap: () => _con.goToLinkedin(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.install_desktop),
//                 title: Text('GitHub'),
//                 // onTap: () => _con.goToGitHub(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.add_call),
//                 title: Text('Whatsapp'),
//                 // onTap: () => _con.goToWhatsapp(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.insert_link_sharp),
//                 title: Text('Intagram'),
//                 // onTap: () => _con.goToInstagram(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.facebook),
//                 title: Text('Facebook'),
//                 // onTap: () => _con.goToFacebook(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.assistant_photo_outlined),
//                 title: Text('elvis.com'),
//                 // onTap: () => _con.goToPagina(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.monetization_on),
//                 title: Text('Donación'),
//                 // onTap: () => _con.goToDonacion(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//               const ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Settings'),
//                 // onTap: () => _con.goToConfiguracion(),
//               ),
//               Divider(
//                 color: Theme.of(context).primaryColor,
//                 height: 1,
//               ),
//             ],
//           ),
//         ),
//       ),
//       ////////////////////////////////////////////////////////////aqui esta el body
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             floating: true,
//             pinned: true,
//             title: Center(child: Text('Developed Projects')),
//             //leadingWidth: 200,
//             expandedHeight: 210,
//             flexibleSpace:
//                 // Image.asset(
//                 //   'assets/images/logo_banner.png',
//                 // ),

//                 Image.network(
//               'https://i.imgur.com/LU2J1r9.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           /////////////////////////////////////////////////////////cuerpo debajo del banner aqui
//           SliverList(delegate: SliverChildListDelegate(images)),
//           ///////////////////////////////////////////////////
//         ],
//       ),
//     );
//   }

//   /////////////////////

//   ///
// }
